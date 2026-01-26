import 'package:injectable/injectable.dart';
import 'package:task_manager_task_board_domain/task_manager_task_board_domain.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: TaskManagerRepository)
class TaskManagerRepositoryImpl extends TaskManagerRepository {
  final TaskBoardDataSource _dataSource;

  TaskManagerRepositoryImpl({required TaskBoardDataSource dataSource}) : _dataSource = dataSource;

  @override
  Future<TaskResult<TaskEntity>> createANewTask(CreateNewTaskForm form) async {
    try {
      final TaskEntity task = TaskEntity(
        id: Uuid().v4(),
        title: form.title,
        description: form.description,
        createdAt: DateTime.now(),
        dueAt: form.dueAt,
        managerId: form.createdBy,
      );
      return _dataSource.saveTask(task);
    } catch (e, trace) {
      return FailedResult(AppFailure(trace: trace));
    }
  }

  @override
  Future<TaskResult<List<TaskEntity>>> getTasksCreatedByUser<Page>(task_managerIdValue id, BasePage<Page> page) async {
    try {
      return await _dataSource.getTasksCreatedByUser(id, page);
    } catch (e, trace) {
      return FailedResult(AppFailure(trace: trace));
    }
  }
}
