

class TodoEntity {
  TodoEntity({
    required this.title,
    this.description,
    this.isFavorite = false,
    this.isDone = false,
  });
  
  final String title;
  final String? description;
  final bool isFavorite;
  final bool isDone;
}
