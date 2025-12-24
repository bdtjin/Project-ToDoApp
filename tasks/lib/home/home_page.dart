import 'package:flutter/material.dart';
import 'package:tasks/home/widgets/add_todo_bottom_sheet.dart';
import 'package:tasks/todo_detail/widgets/todo_entity.dart';
import 'package:tasks/todo_detail/widgets/to_do_view.dart';

// (3) StatelessWidget -> StatefulWidget으로 상태 변경
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 할 일을 담아둘 리스트 (추가되면 화면 바뀜)
   List<TodoEntity> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 190, 188, 188,), // body 백그라운드 컬러
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 226, 223, 223), // appBar 컬러
        title: Text(
          "지니`s Tasks",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),


      body: Padding(
        padding: EdgeInsets.all(20),
        // (3) 삼항연산자: 리스트가 비어있으면 Column 안에 내용 표시(homepage)
        child: todoList.isEmpty ? Column(
          children: [
            Container(
              width: 350,
              height: 210,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(255, 224, 219, 219),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/초록색투두.webp',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover, // 크기가 고정되었으나 이미지를 일관된 사이즈로 유지
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    '아직 할 일이 없음',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 93, 92, 92),
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    '할 일을 추가하고 지니`s Tesks에서\n할 일을 추적하세요.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Color.fromARGB(255, 142, 139, 139),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ) 
        // (3) 삼항연산자: 할일리스트가 생겼을 때, ToDoView 화면을 표시
        : ListView.builder( 
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            final todo = todoList[index];
            return ToDoView(
              toDo: todo,
              onToggleDone: () => setState(() => todo.isDone = !todo.isDone),
              onToggleFavorite: () => setState(() => todo.isFavorite = !todo.isFavorite),
            );
          },
        ),
      ),

      // body 밖에서 사용, scaffold 안. // 플로팅버튼은 꼭 onPressed를 전달해줘야 작동함
      // 버튼 구역 => 버튼을 누르면 하단이 올라오게 함수를 부름 (onPressed)
      floatingActionButton: FloatingActionButton(
        onPressed: () => addTodo(context), //(지금 화면정보 context를 알려주고 함수한테 전달)
        backgroundColor: const Color.fromARGB(255, 96, 157, 99),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 24),
      ),
    );
  }

  // (2) 바텀시트 활성화
  // (3)'저장' 함수 연결
  void addTodo(BuildContext context) {
    // BottomSheet를 버튼이 누르면 작동되기에 showModalBottomSheet를 사용
    showModalBottomSheet(
     isScrollControlled: true,
      context: context,
      builder: (context) {
        return AddTodoBottomSheet(
          deliver : (String newTitle, bool isFavorite, String newDescription){
            setState(() {
              todoList.add(
                TodoEntity(
                  title: newTitle, // 새할일 제목
                  isFavorite: isFavorite, // 별모양 이모키톤
                  description: newDescription, // 상세설명
                  isDone: false,)
              );
            });
          }
        );
      },
    );
  }
}
