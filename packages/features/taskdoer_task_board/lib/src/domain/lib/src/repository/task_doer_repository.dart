import 'package:core/core.dart';

abstract class TaskDoerRepository {
  Future<TaskResult<List<TaskEntity>>> getTasksAssignedToUser<Page>(AssigneeIdValue id, BasePage<Page> page);
}