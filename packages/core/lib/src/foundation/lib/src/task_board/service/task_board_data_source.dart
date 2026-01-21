import 'package:base/base.dart';
import 'package:foundation/foundation.dart';

abstract class TaskBoardDataSource {
  Future<TaskResult<TaskEntity>> saveTask(TaskEntity task);

  Future<TaskResult<List<TaskEntity>>> getTasksAssignedToUser<Page>(AssigneeIdValue assigneeId, BasePage<Page> page);

  Future<TaskResult<List<TaskEntity>>> getTasksCreatedByUser<Page>(TaskManagerIdValue taskMangerId, BasePage<Page> page);
}
