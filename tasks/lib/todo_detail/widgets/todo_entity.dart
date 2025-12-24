

import 'package:flutter/material.dart';
import 'to_do_view.dart';


class TodoEntity {
  String title;
  String? description;
  bool isFavorite; // final 삭제 (변경 가능한 상태로 바꿔줌)
  bool isDone;     // final 삭제 (변경 가능한 상태로 바꿔줌)

  TodoEntity({
    required this.title, // 할일 목록
    this.description,    // 상세 내용
    this.isFavorite = false,
    this.isDone = false,
  });
}


