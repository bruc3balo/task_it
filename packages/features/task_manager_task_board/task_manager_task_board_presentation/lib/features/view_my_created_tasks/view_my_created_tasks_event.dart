part of 'view_my_created_tasks_bloc.dart';

@immutable
sealed class ViewMyCreatedTasksEvent {}

final class LoadMoreOfMyTasksEvent extends ViewMyCreatedTasksEvent {}
