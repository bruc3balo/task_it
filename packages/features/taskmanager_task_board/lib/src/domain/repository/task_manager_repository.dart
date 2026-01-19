import 'package:base/base.dart';
import 'package:base_task_board/task_board.dart';
import 'package:taskmanager_task_board/src/domain/forms/create_new_task_form.dart';

abstract class TaskManagerRepository {
  Future<TaskResult<TaskEntity>> createANewTask(CreateNewTaskForm form);
  Future<TaskResult<TaskEntity>> getTasksCreatedByUser(TaskManagerIdValue id);
}