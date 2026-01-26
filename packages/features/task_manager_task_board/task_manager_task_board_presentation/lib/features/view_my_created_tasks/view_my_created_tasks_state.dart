part of 'view_my_created_tasks_bloc.dart';

@immutable
sealed class ViewMyCreatedTasksState {}

final class LoadingViewMyCreatedTasksState extends ViewMyCreatedTasksState {}
final class LoadedViewMyCreatedTasksState extends ViewMyCreatedTasksState {
  final List<TaskEntity>? lastFetchedResults;

  LoadedViewMyCreatedTasksState({this.lastFetchedResults});
}
