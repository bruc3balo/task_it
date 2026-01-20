import 'package:base/base.dart';
import 'package:base_task_board/task_board.dart';
import 'package:taskmanger_taskboard_domain/src/forms/_forms.dart';

abstract class TaskManagerRepository {
  Future<TaskResult<TaskEntity>> createANewTask(CreateNewTaskForm form);
  Future<TaskResult<List<TaskEntity>>> getTasksCreatedByUser<Page>(TaskManagerIdValue id, BasePage<Page> page);
}