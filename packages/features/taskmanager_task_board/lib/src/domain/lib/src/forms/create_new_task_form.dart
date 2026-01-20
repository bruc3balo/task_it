import 'task_form.dart';
import 'package:base_task_board/task_board.dart';

class CreateNewTaskForm extends TaskForm {
  final TaskManagerIdValue createdBy;

  CreateNewTaskForm({required this.createdBy, required super.title, required super.description});
}
