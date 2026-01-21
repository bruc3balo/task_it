import 'package:taskdoer_task_board_domain/domain.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TaskDoerRepository)
class TaskDoerRepositoryImpl extends TaskDoerRepository {
  final TaskBoardDataSource _dataSource;

  TaskDoerRepositoryImpl({required TaskBoardDataSource dataSource}) : _dataSource = dataSource;

  @override
  Future<TaskResult<List<TaskEntity>>> getTasksAssignedToUser<Page>(AssigneeIdValue id, BasePage<Page> page) async {
    try {

      return await _dataSource.getTasksAssignedToUser(id, page);
    } catch (e, trace) {
      return FailedResult(AppFailure(trace: trace));
    }
  }
}
