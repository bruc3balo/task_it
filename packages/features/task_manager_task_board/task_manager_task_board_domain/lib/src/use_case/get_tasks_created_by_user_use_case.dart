import 'package:core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:task_manager_task_board_domain/src/forms/_forms.dart';
import 'package:task_manager_task_board_domain/src/repository/_repository.dart';

@LazySingleton()
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
