import 'package:core/core.dart';
import 'package:taskmanger_taskboard_domain/src/forms/_forms.dart';

abstract class TaskManagerRepository {
  Future<TaskResult<TaskEntity>> createANewTask(CreateNewTaskForm form);
  Future<TaskResult<List<TaskEntity>>> getTasksCreatedByUser<Page>(TaskManagerIdValue id, BasePage<Page> page);
}