import 'dart:collection';

import 'package:base/src/result/task_result.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:taskdoer_task_board_domain/domain.dart';

part 'view_my_assigned_tasks_event.dart';

part 'view_my_assigned_tasks_state.dart';

@Injectable()
class ViewMyAssignedTasksBloc extends Bloc<ViewMyAssignedTasksEvent, ViewMyAssignedTasksState> {
  final GetTasksAssignedToUserUseCase _getTasksAssignedToUserUseCase;
  final SplayTreeSet<TaskEntity> _taskSet = SplayTreeSet((a,b) => a.createdAt.compareTo(b.createdAt));

  int get _pageSize => 20;

  ViewMyAssignedTasksBloc(GetTasksAssignedToUserUseCase getTasksAssignedToUserUseCase)
    : _getTasksAssignedToUserUseCase = getTasksAssignedToUserUseCase,
      super(LoadedViewMyAssignedTasksState()) {
    on<LoadMoreOfMyAssignedTasksEvent>(_loadMoreTasks);
  }

  Future<void> _loadMoreTasks(LoadMoreOfMyAssignedTasksEvent event, Emitter<ViewMyAssignedTasksState> emit) async {
    if (state is! LoadedViewMyAssignedTasksState) return;

    List<TaskEntity>? lastFetchedTasks = (state as LoadedViewMyAssignedTasksState).lastFetchedTasks;
    try {
      emit(LoadingViewMyAssignedTasksState());

      var taskResult = await _getTasksAssignedToUserUseCase.execute(
        params: GetAssignedTasksPage(page: lastFetchedTasks?.lastOrNull, pageSize: _pageSize),
      );

      switch (taskResult) {
        case FailedResult<List<TaskEntity>>():
          emit(LoadedViewMyAssignedTasksState(lastFetchedTasks: lastFetchedTasks));
          break;
        case SuccessResult<List<TaskEntity>>():
          _taskSet.addAll(taskResult.result);
          emit(LoadedViewMyAssignedTasksState(lastFetchedTasks: taskResult.result));
          break;
      }
    } catch (e, trace) {
      emit(LoadedViewMyAssignedTasksState(lastFetchedTasks: lastFetchedTasks));
    }
  }
}
