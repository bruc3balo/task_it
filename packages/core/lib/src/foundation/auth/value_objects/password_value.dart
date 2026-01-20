import 'package:base/base.dart';

class PasswordValue {
  final String value;

  PasswordValue(this.value) : assert(passwordValidationError(value) == null);
}