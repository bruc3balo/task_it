part of 'view_my_assigned_tasks_bloc.dart';

@immutable
sealed class ViewMyAssignedTasksEvent {}

final class LoadMoreOfMyAssignedTasksEvent extends ViewMyAssignedTasksEvent {

}