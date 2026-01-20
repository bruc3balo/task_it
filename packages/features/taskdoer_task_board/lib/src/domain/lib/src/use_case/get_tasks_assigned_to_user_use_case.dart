import 'package:base/base.dart';
import 'package:base_task_board/task_board.dart';
import 'package:taskdoer_task_board_domain/src/forms/_forms.dart';
import 'package:taskdoer_task_board_domain/src/repository/_repository.dart';

class GetTasksAssignedToUserUseCase<Page> extends BaseUseCase<List<TaskEntity>, GetAssignedTasksPage<Page>> {
  final TaskDoerRepository _taskDoerRepository;

  GetTasksAssignedToUserUseCase({required TaskDoerRepository taskDoerRepository}) : _taskDoerRepository = taskDoerRepository;

  @override
  Future<TaskResult<List<TaskEntity>>> execute({required GetAssignedTasksPage<Page> params}) async {
    try {
      //TODO: Get AssigneeIdValue from local storage
      return await _taskDoerRepository.getTasksAssignedToUser(params.managerIdValue, params);
    } catch (e, trace) {
      return FailedResult(AppFailure(trace: trace));
    }
  }
}
