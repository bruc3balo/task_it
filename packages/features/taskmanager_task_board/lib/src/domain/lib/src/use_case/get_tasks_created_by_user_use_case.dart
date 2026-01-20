import 'package:core/core.dart';
import 'package:base_task_board/task_board.dart';
import 'package:taskmanger_taskboard_domain/src/forms/_forms.dart';
import 'package:taskmanger_taskboard_domain/src/repository/_repository.dart';

class GetTasksCreatedByUserUseCase<Page> extends BaseUseCase<List<TaskEntity>, GetCreatedTasksPage<Page>> {
  final TaskManagerRepository _taskManagerRepository;
  final AppAuthenticatorService _appAuthenticatorService;

  GetTasksCreatedByUserUseCase({required TaskManagerRepository taskManagerRepository, required AppAuthenticatorService appAuthenticatorService})
    : _taskManagerRepository = taskManagerRepository,
      _appAuthenticatorService = appAuthenticatorService;

  @override
  Future<TaskResult<List<TaskEntity>>> execute({required GetCreatedTasksPage<Page> params}) async {
    try {
      var currentUserResult = await _appAuthenticatorService.getCurrentUser();
      switch (currentUserResult) {
        case FailedResult<AuthUser>():
          return FailedResult.fromFailure(currentUserResult);
        case SuccessResult<AuthUser>():
          return await _taskManagerRepository.getTasksCreatedByUser(TaskManagerIdValue(currentUserResult.result.id.value), params);
      }
    } catch (e, trace) {
      return FailedResult(AppFailure(trace: trace));
    }
  }
}
