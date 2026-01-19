import 'package:base/base.dart';

class TaskTitleValue {
  final String value;

  TaskTitleValue(this.value) : assert(taskTitleValidationError(value) == null);
}