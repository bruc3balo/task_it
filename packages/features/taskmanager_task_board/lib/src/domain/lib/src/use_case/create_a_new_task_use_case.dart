import 'package:core/core.dart';
import 'package:base_task_board/task_board.dart';
import 'package:taskmanger_taskboard_domain/src/forms/_forms.dart';
import 'package:taskmanger_taskboard_domain/src/repository/_repository.dart';

class CreateANewTaskUseCase extends BaseUseCase<TaskEntity, TaskForm> {
  final TaskManagerRepository _taskManagerRepository;
  final AppAuthenticatorService _appAuthenticatorService;

  CreateANewTaskUseCase({required TaskManagerRepository taskManagerRepository, required AppAuthenticatorService appAuthenticatorService})
    : _taskManagerRepository = taskManagerRepository,
      _appAuthenticatorService = appAuthenticatorService;

  @override
  Future<TaskResult<TaskEntity>> execute({required TaskForm params}) async {
    try {
      var currentUserResult = await _appAuthenticatorService.getCurrentUser();
      switch (currentUserResult) {
        case FailedResult<AuthUser>():
          return FailedResult.fromFailure(currentUserResult);
        case SuccessResult<AuthUser>():
          return await _taskManagerRepository.createANewTask(
            CreateNewTaskForm(createdBy: TaskManagerIdValue(currentUserResult.result.id.value), title: params.title, description: params.description),
          );
      }
    } catch (e, trace) {
      return FailedResult(AppFailure(trace: trace));
    }
  }
}
