import 'package:flutter/material.dart';

class AddTodoBottomSheet extends StatefulWidget {
  const AddTodoBottomSheet({super.key});
  @override
  State<AddTodoBottomSheet> createState() => _AddTodoBottomSheetState();
}

// 2-1. class _AddTodoBottomSheetState 만들기 (하단 누르면 키보드) (행동값)
class _AddTodoBottomSheetState extends State<AddTodoBottomSheet> {
  // 새할일, 세부정보 TextController => 리모컨 같은 역할
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  // 즐겨찾기, 세부사항 아이콘 (조건문을 위해 선언)
  bool isFavorite = false;
  bool isDescription = false;
  bool canSave = false;

  // 2-4.'저장'버튼 함수 (새할일에 글씨가 있으면 저장)
  void saveToDo() {
    if (titleController.text.isEmpty) return;
    Navigator.of(context).pop();
  }

  // 2-4.저장 버튼 활성화 -> 택스트 변경될 때마다 setState
  @override
  void initState() {
    super.initState();
    titleController.addListener(() {
      setState(() {
        canSave = titleController.text.isNotEmpty;
      });
    });
  }
  // 2-4.저장 버튼 활성화를 위해 생성
  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 12,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),

      // 2-2. 키보드 + 새할일 TextField
      child: Column(
        mainAxisSize: MainAxisSize.min, // 키보드가 현재 가진 사이즈만큼 올라올 수 있도록
        children: [
          TextField(
            controller: titleController,
            autofocus: true, // 자동으로 포커스 주기 (공식문서참고)
            style: const TextStyle(fontSize: 16),
            maxLines: 1, // 최대 라인수 1개, 줄바꿈 제한
            textInputAction: TextInputAction.done, // 엔터키 X
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "새 할 일",
            ),
         ),


          // 세부사항 Icon - TextField
          // 삼항연산자보다는 if 문이 더 직관적
          if (isDescription)
            Flexible(
              child: TextField(
                autofocus: true, // 자동으로 포커스 주기 (공식문서참고)
                style: const TextStyle(fontSize: 14),
                maxLines: null, // 줄바꿈 되도록 구현 (+Flexible)
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "세부정보 추가",
                ),
              ),
            ),

          // 2-3. 아이콘 + 저장 버튼 추가하기
          Row(
            children: [
              // 세부사항 Icon
              // 조건문 기능 + 삼항연산자 활용해서 아이콘 숨기기 및 텍스트창 보이기
              !isDescription
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isDescription = true;
                        });
                      },
                      icon: const Icon(Icons.short_text_rounded, size: 24),
                    )
                  : const SizedBox(),

              // 즐겨찾기 Icon
              // 삼항연산자를 활용
              IconButton(
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                icon: Icon(
                  isFavorite ? Icons.star : Icons.star_border,
                  color: isFavorite ? Colors.amber : null,
                  size: 24,
                ),
              ),

              Spacer(),

              // 2-4.저장 버튼
              TextButton(
                onPressed: titleController.text.isNotEmpty
                    ? saveToDo // 내용이 있으면 저장 함수 사용
                    : null, // 내용 없으면 함수 사용 X
                child: Text("저장", style: TextStyle(fontSize: 14, 
                color: canSave ? Colors.red : Colors.blue ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
