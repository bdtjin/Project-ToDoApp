

import 'package:flutter/material.dart';
import 'to_do_view.dart';

class TodoEntity {
  String title;
  String? description;

  bool isFavorite; // final 삭제 (변경 가능한 상태로 바꿔줌)
  bool isDone;     // final 삭제 (변경 가능한 상태로 바꿔줌)

  TodoEntity({
    required this.title,
    this.description,
    this.isFavorite = false,
    this.isDone = false,
  });
}


