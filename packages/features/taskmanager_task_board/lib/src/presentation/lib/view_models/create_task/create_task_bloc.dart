import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:base_task_board/task_board.dart';
import 'package:base/base.dart';
import 'package:taskmanger_taskboard_domain/domain.dart';

part 'create_task_event.dart';
part 'create_task_state.dart';

class CreateTaskBloc extends Bloc<CreateTaskEvent, CreateTaskState> {
  final CreateANewTaskUseCase _createANewTaskUseCase;

  CreateTaskBloc(CreateANewTaskUseCase createANewTaskUseCase) : _createANewTaskUseCase = createANewTaskUseCase, super(InitialCreateTaskState()) {
    on<CreateANewTaskEvent>(_createTask);
  }

  Future<void> _createTask(CreateANewTaskEvent event, Emitter<CreateTaskState> emit) async {
    if (state is! InitialCreateTaskState) return;

    try {
      var createTaskState = await _createANewTaskUseCase.execute(
        params: TaskForm(title: event.title, description: event.description),
      );

      switch (createTaskState) {
        case FailedResult<TaskEntity>():
          emit(ErrorCreateTaskState(createTaskState.failure));
          break;
        case SuccessResult<TaskEntity>():
          emit(SuccessCreateTaskState(createdTask: createTaskState.result));
          break;
      }
    } catch (e, trace) {
      emit(ErrorCreateTaskState(AppFailure(trace: trace)));
    }
  }
}
