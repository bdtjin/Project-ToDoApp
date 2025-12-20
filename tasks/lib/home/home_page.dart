import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
        255,
        190,
        188,
        188,
      ), // body 백그라운드 컬러
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 226, 223, 223), // appBar 컬러
        title: Text(
          "지니`s Tasks",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),

      // 박스 안 여백으로 상자를 배치
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: 350,
              height: 210,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(255, 224, 219, 219),
              ),

              child: Column(
                // 사진 가운데 정렬
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/초록색투두.webp',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover, // 크기가 고정되었으나 이미지를 일관된 사이즈로 유지
                  ),
                  const SizedBox(height: 10), // 사진과 글자 간격주기

                  const Text(
                    '아직 할 일이 없음',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 93, 92, 92),
                    ),
                  ),

                  const SizedBox(height: 12), // 글자와 글자 간격주기

                  const Text(
                    '할 일을 추가하고 지니`s Tesks에서\n할 일을 추적하세요.',
                    textAlign: TextAlign.center, // 가로 공간 안에서 글자 가운데 정렬
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

  // 함수를 클래스 안으로 가져오고 context를 받도록
  void addTodo(BuildContext context) {
    // BottomSheet를 버튼이 누르면 작동되기에 showModalBottomSheet를 사용
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const AddTodoBottomSheet(); // 아래 함수에서 만들 class를 부를기
      },
    );
  }
}
// ------------------------------ 클래스 -> 함수

// 1. class AddTodoBottomSheet 만들기 (바텀시트 만들기)
// StatefulWidget으로 고정, const (생성자) 변하지 않는 상수
class AddTodoBottomSheet extends StatefulWidget{
  const AddTodoBottomSheet({super.key});
  @override
  State<AddTodoBottomSheet> createState() => _AddTodoBottomSheetState();
}
// 2. class _AddTodoBottomSheetState 만들기 (하단 누르면 키보드) (행동값)
class _AddTodoBottomSheetState extends State<AddTodoBottomSheet>{
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(
      left: 20, right: 20, top: 12,
      bottom: MediaQuery.of(context).viewInsets.bottom
    ),

// 3. 키보드 만들기
    child: Column(
      mainAxisSize: MainAxisSize.min, // 키보드가 현재 가진 사이즈만큼 올라올 수 있도록
      children: [TextField(
          autofocus: true, // 자동으로 포커스 주기 (공식문서참고)
          style: const TextStyle(fontSize: 16),
          maxLines: 1, // 최대 라인수 1개, 줄바꿈 제한
          textInputAction: TextInputAction.done, // 엔터키 X
          decoration: const InputDecoration(
            hintText: "새 할 일", 
          ),
// 4. 아이콘 + 저장 버튼 추가하기
        ),
      ],
    ),
    );
  }
}