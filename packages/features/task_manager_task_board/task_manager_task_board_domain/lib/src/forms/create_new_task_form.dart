import 'package:core/core.dart';
import 'task_form.dart';

class CreateNewTaskForm extends TaskForm {
  final task_managerIdValue createdBy;

  CreateNewTaskForm({required this.createdBy, required super.title, required super.description, required super.dueAt});
}
