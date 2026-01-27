import 'package:base/base.dart';

class TaskManagerIdValue {

  //This represents the user id
  final String value;

  TaskManagerIdValue(this.value) : assert(userIdValidationError(value) != null);
}