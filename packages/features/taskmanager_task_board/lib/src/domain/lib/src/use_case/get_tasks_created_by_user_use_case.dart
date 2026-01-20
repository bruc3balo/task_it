import 'package:base/base.dart';
import 'package:base_task_board/task_board.dart';
import 'package:taskmanger_taskboard_domain/src/forms/_forms.dart';
import 'package:taskmanger_taskboard_domain/src/repository/_repository.dart';

class GetTasksCreatedByUserUseCase<Page> extends BaseUseCase<List<TaskEntity>, GetCreatedTasksPage<Page>> {
  final TaskManagerRepository _taskManagerRepository;

  GetTasksCreatedByUserUseCase({required TaskManagerRepository taskManagerRepository}) : _taskManagerRepository = taskManagerRepository;

  @override
  Future<TaskResult<List<TaskEntity>>> execute({required GetCreatedTasksPage<Page> params}) async {
    try {
      //TODO: Get TaskManagerIdValue from local storage
      return await _taskManagerRepository.getTasksCreatedByUser(params.managerIdValue, params);
    } catch (e, trace) {
      return FailedResult(AppFailure(trace: trace));
    }
  }
}
