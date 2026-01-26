import 'package:base/base.dart';

class task_managerIdValue {

  //This represents the user id
  final String value;

  task_managerIdValue(this.value) : assert(userIdValidationError(value) == null);
}