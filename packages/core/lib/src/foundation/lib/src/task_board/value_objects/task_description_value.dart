import 'package:base/base.dart';

class TaskDescriptionValue {
  final String value;

  TaskDescriptionValue(this.value) : assert(taskDescriptionValidationError(value) == null);
}