part of 'view_my_assigned_tasks_bloc.dart';

@immutable
sealed class ViewMyAssignedTasksState {}

final class LoadingViewMyAssignedTasksState extends ViewMyAssignedTasksState {}

final class LoadedViewMyAssignedTasksState extends ViewMyAssignedTasksState {
  final List<TaskEntity>? lastFetchedTasks;

  LoadedViewMyAssignedTasksState({this.lastFetchedTasks});
}
