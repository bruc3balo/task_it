import 'package:core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:task_manager_task_board_domain/src/forms/_forms.dart';
import 'package:task_manager_task_board_domain/src/repository/_repository.dart';


@LazySingleton()
class CreateANewTaskUseCase extends BaseUseCase<TaskEntity, TaskForm> {
  final TaskManagerRepository _taskManagerRepository;
  final AppAuthenticatorService _appAuthenticatorService;

  CreateANewTaskUseCase({required TaskManagerRepository task_managerRepository, required AppAuthenticatorService appAuthenticatorService})
    : _taskManagerRepository = task_managerRepository,
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
            CreateNewTaskForm(
              createdBy: TaskManagerIdValue(currentUserResult.result.id.value),
              title: params.title,
              description: params.description,
              dueAt: params.dueAt,
            ),
          );
      }
    } catch (e, trace) {
      print(e.toString());
      print(trace);
      return FailedResult(AppFailure(trace: trace));
    }
  }
}
