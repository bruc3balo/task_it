part of 'create_task_bloc.dart';

@immutable
sealed class CreateTaskState {}

final class InitialCreateTaskState extends CreateTaskState {}

final class LoadingCreateTaskState extends CreateTaskState {}

final class SuccessCreateTaskState extends CreateTaskState {
  final TaskEntity createdTask;

  SuccessCreateTaskState({required this.createdTask});
}

final class ErrorCreateTaskState extends CreateTaskState {
  final AppFailure failure;

  ErrorCreateTaskState(this.failure);
}
