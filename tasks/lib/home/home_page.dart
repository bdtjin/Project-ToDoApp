import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 190, 188, 188), // 바디 백그라운드 컬러
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 226, 223, 223), // appBar 컬러
        title: Text(
          "지니`s Tasks",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        // 박스 안 여백으로 상자를 배치
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
                mainAxisAlignment: MainAxisAlignment.center, // 사진 가운데 정렬
                children: [
                  Image.asset(
                    'assets/images/초록색투두.webp',
                    width: 120,
                    height: 90,
                  ),
                  const SizedBox(height: 15), // 사진과 글자 간격주기
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
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Scaffold 속성에서 사용
        onPressed: appTodo, // 플로팅버튼은 꼭 onPressed를 전달해줘야 작동함
        backgroundColor: const Color.fromARGB(255, 96, 157, 99),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 24),
      ),
    );
  }

  void appTodo() {
    // 버튼이 눌렸는지 확인
    print("버튼 눌렀당");
  }
}


// Cmd + K => 키보드 안 올라올때, 이거 눌러서 사용(맥북 키보드 <-> 아이폰 키보드를 보이게 해서 쓸거냐)