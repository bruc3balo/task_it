import 'dart:collection';

import 'package:base/src/result/task_result.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:task_manager_task_board_domain/task_manager_task_board_domain.dart';

part 'view_my_created_tasks_event.dart';

part 'view_my_created_tasks_state.dart';

@Injectable()
class ViewMyCreatedTasksBloc extends Bloc<ViewMyCreatedTasksEvent, ViewMyCreatedTasksState> {
  final GetTasksCreatedByUserUseCase _getTasksCreatedByUserUseCase;
  final SplayTreeSet<TaskEntity> _taskSet = SplayTreeSet((a, b) => a.createdAt.compareTo(b.createdAt));
  
  int get pageSize => 10;

  ViewMyCreatedTasksBloc(GetTasksCreatedByUserUseCase getTasksCreatedByUserUseCase)
    : _getTasksCreatedByUserUseCase = getTasksCreatedByUserUseCase,
      super(LoadedViewMyCreatedTasksState()) {
    on<LoadMoreOfMyTasksEvent>(_loadMoreTasks);
  }

  Future<void> _loadMoreTasks(LoadMoreOfMyTasksEvent event, Emitter<ViewMyCreatedTasksState> emit) async {
    if (state is! LoadedViewMyCreatedTasksState) return;

    List<TaskEntity>? lastFetchedResults = (state as LoadedViewMyCreatedTasksState).lastFetchedResults;
    try {
      emit(LoadingViewMyCreatedTasksState());

      var loadResult = await _getTasksCreatedByUserUseCase.execute(params: GetCreatedTasksPage(page: lastFetchedResults?.lastOrNull, pageSize: pageSize));
      switch (loadResult) {
        case FailedResult<List<TaskEntity>>():
          //TODO: Toast message
          emit(LoadedViewMyCreatedTasksState(lastFetchedResults: lastFetchedResults));
          break;
        case SuccessResult<List<TaskEntity>>():
          lastFetchedResults = loadResult.result;
          _taskSet.addAll(loadResult.result);
          emit(LoadedViewMyCreatedTasksState(lastFetchedResults: lastFetchedResults));
          break;
      }
    } catch (e, trace) {
      emit(LoadedViewMyCreatedTasksState(lastFetchedResults: lastFetchedResults));
    }
  }
}
