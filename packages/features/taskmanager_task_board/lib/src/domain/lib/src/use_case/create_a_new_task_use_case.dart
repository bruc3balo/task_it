import 'package:base/base.dart';
import 'package:base_task_board/task_board.dart';
import 'package:taskmanger_taskboard_domain/src/forms/_forms.dart';
import 'package:taskmanger_taskboard_domain/src/repository/_repository.dart';


class CreateANewTaskUseCase extends BaseUseCase<TaskEntity, TaskForm> {

  final TaskManagerRepository _taskManagerRepository;

  CreateANewTaskUseCase({required TaskManagerRepository taskManagerRepository}) : _taskManagerRepository = taskManagerRepository;

  @override
  Future<TaskResult<TaskEntity>> execute({required TaskForm params}) async {
    try {

      //TODO: Get createdBy from local storage
       return await _taskManagerRepository.createANewTask(CreateNewTaskForm(createdBy: createdBy, title: params.title, description: params.description));
    } catch(e, trace) {
      return FailedResult(AppFailure(trace: trace));
    }
  }
}
