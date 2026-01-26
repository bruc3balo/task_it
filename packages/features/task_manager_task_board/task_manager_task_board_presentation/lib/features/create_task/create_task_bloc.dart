import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:base/base.dart';
import 'package:task_manager_task_board_domain/task_manager_task_board_domain.dart';

part 'create_task_event.dart';

part 'create_task_state.dart';

@Injectable()
class CreateTaskBloc extends Bloc<CreateTaskEvent, CreateTaskState> {
  final CreateANewTaskUseCase _createANewTaskUseCase;

  CreateTaskBloc(CreateANewTaskUseCase createANewTaskUseCase) : _createANewTaskUseCase = createANewTaskUseCase, super(InitialCreateTaskState()) {
    on<CreateANewTaskEvent>(_createTask);
  }

  Future<void> _createTask(CreateANewTaskEvent event, Emitter<CreateTaskState> emit) async {
    if (state is! InitialCreateTaskState) return;

    try {
      var createTaskState = await _createANewTaskUseCase.execute(
        params: TaskForm(title: event.title, description: event.description, dueAt: event.dueAt),
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
