import 'package:flutter/material.dart';
import 'package:tasks/todo_entity.dart';

class ToDoDetail extends StatefulWidget {
  final TodoEntity todo; // 홈페이지에서 넘겨받은 데이터
  final VoidCallback onToggleFavorite; // 별표를 터치 시에 홈페이지 화면도 새로고침

  // 생성자, 이 페이지 열때 할일, 버튼 터칫시 현상을 넣어줌
  const ToDoDetail({
    super.key,
    required this.todo,
    required this.onToggleFavorite,
  });

  @override
  State<ToDoDetail> createState() => _ToDoDetailState();
}

class _ToDoDetailState extends State<ToDoDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 190, 188, 188,),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 226, 223, 223),
        // 4-1. 앱바 왼쪽의 '뒤로가기'버튼
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: (){Navigator.pop(context);
        },),

        // 4-1. 앱바 오른쪽 '별모양' 버튼
        actions: [
          IconButton(
            icon: Icon(
              // 현재 상태가 참이면 노란색별, 거짓이면 빈별
              widget.todo.isFavorite ? Icons.star : Icons.star_border,
              color: widget.todo.isFavorite ? Colors.amber : null,
            ),
            onPressed: (){ // 이 버튼을 누를 시에
            // homepage 화면으로 데이터 변경
              setState(() {
                widget.onToggleFavorite();
              });
            },
          )
        ],
      ),
      // 4. 상세페이지 바디영역
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 4-2. 새할일 제목으로 데이터 받아서 보여주ㄱ;
            Text(
              widget.todo.title, // todo_entity 에서 만든 클래스 
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20,),
            // 4-2. 세부항목 보여주기 전
            Row(
              children: [
                const Icon(Icons.short_text_rounded, color: Colors.black, size: 20,),
                const SizedBox(width: 20,),
                const Text('세부 내용은 다음과 같습니다.', style: TextStyle(fontSize: 16,color: Colors.black),)
              ],
            ),
            const SizedBox(width: 10,),
            // 4-2. 세부항목 데이터 받아서 보여주기
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                ),
                child: Text( // todo_entity 에서 만든 클래스 불러오기
                // 상세 내용을 꺼내고, 만약 비어있다면 해당 텍스트를 보이게 설정
                  widget.todo.description ?? '세부 내용은 여기에 작성합니다.',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
