import 'package:base/base.dart';

class AssigneeIdValue {

  //This represents the user id
  final String value;

  AssigneeIdValue(this.value) : assert(userIdValidationError(value) == null);
}