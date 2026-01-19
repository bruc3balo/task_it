
import 'package:base_task_board/task_board.dart';

class CreateNewTaskForm {
  final TaskTitleValue title;
  final TaskDescriptionValue description;
  final TaskManagerIdValue createdBy;

  CreateNewTaskForm({required this.title, required this.description, required this.createdBy});
}
