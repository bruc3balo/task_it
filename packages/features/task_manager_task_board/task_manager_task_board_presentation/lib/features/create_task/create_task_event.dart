part of 'create_task_bloc.dart';

@immutable
sealed class CreateTaskEvent {}

final class CreateANewTaskEvent extends CreateTaskEvent {
  final TaskTitleValue title;
  final TaskDescriptionValue description;
  final DateTime? dueAt;

  CreateANewTaskEvent({required this.title, required this.description, required this.dueAt});
}
