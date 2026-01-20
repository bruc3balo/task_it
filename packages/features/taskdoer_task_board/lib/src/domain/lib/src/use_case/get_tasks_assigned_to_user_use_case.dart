import 'package:core/core.dart';
import 'package:base_task_board/task_board.dart';
import 'package:taskdoer_task_board_domain/src/forms/_forms.dart';
import 'package:taskdoer_task_board_domain/src/repository/_repository.dart';

class GetTasksAssignedToUserUseCase<Page> extends BaseUseCase<List<TaskEntity>, GetAssignedTasksPage<Page>> {
  final TaskDoerRepository _taskDoerRepository;
  final AppAuthenticatorService _appAuthenticatorService;

  GetTasksAssignedToUserUseCase({required TaskDoerRepository taskDoerRepository, required AppAuthenticatorService appAuthenticatorService})
    : _taskDoerRepository = taskDoerRepository,
      _appAuthenticatorService = appAuthenticatorService;

  @override
  Future<TaskResult<List<TaskEntity>>> execute({required GetAssignedTasksPage<Page> params}) async {
    try {
      var currentUserResult = await _appAuthenticatorService.getCurrentUser();
      switch (currentUserResult) {
        case FailedResult<AuthUser>():
          return FailedResult.fromFailure(currentUserResult);
        case SuccessResult<AuthUser>():
          return await _taskDoerRepository.getTasksAssignedToUser(AssigneeIdValue(currentUserResult.result.id.value), params);
      }
    } catch (e, trace) {
      return FailedResult(AppFailure(trace: trace));
    }
  }
}
