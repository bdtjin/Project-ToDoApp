import 'package:flutter/material.dart';
import 'package:tasks/todo_detail/detail_page.dart';
import 'todo_entity.dart';

class ToDoView extends StatelessWidget {
  const ToDoView({
    super.key,
    required this.toDo,
    required this.onToggleFavorite,
    required this.onToggleDone,
  });

  final TodoEntity toDo;
  final VoidCallback onToggleFavorite;
  final VoidCallback onToggleDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      // 3-1. 수직, 수평, 라운딩
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
      ),

      child: Row(
        children: [
          // 3-2. 버튼을 눌렀을 때, 왼쪽 아이콘 상태 변경
          GestureDetector(
            onTap: onToggleDone,
            child: Icon(
              toDo.isDone ? Icons.check_circle : Icons.circle_outlined,
            ),
          ),

          // 3-1. 요소들 간 간격
          const SizedBox(width: 12),

          
          Expanded(
            // 4-3. ToDoEntity 받아서 화면 컨텐츠
            // 화면 클릭에 실행
            child: GestureDetector(
              onTap: () {
                Navigator.push( // 새화면 띄워주는 역할
                  context,
                  MaterialPageRoute(
                    // 상세페이지로 가게 도와주ㅠ는 역할
                    builder: (context) => ToDoDetail(
                      todo: toDo, // 현재 줄의 할일 데이터를 그대로 가져감
                      onToggleFavorite: onToggleFavorite, // homepage 별표 버튼도 같이
                    ),
                  ),
                );
              },
              // 3-2. 버튼 눌렀을 때, 취소선 상태 변경
              child: Text(
                toDo.title,
                style: TextStyle(
                  fontSize: 16,
                  decoration: toDo.isDone ? TextDecoration.lineThrough : null,
                  color: toDo.isDone ? Colors.grey : Colors.black,
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          // 3-2. 버튼 눌렀을 때, 별아이콘 상태 변경
          GestureDetector(
            onTap: onToggleFavorite,
            child: Icon(
              toDo.isFavorite ? Icons.star : Icons.star_border,
              color: toDo.isFavorite ? Colors.amber : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
