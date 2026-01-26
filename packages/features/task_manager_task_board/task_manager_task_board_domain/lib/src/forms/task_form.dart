import 'package:core/core.dart';

class TaskForm {
  final TaskTitleValue title;
  final TaskDescriptionValue description;
  final DateTime? dueAt;

  TaskForm({required this.title, required this.description, required this.dueAt});
}
