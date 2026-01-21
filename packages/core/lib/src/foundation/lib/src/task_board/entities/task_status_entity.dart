enum TaskStatusEntity {
  pending(0),
  inProgress(1),
  done(2);

  final int code;

  const TaskStatusEntity(this.code);
}
