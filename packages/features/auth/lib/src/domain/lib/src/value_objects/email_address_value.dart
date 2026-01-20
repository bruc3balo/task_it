import 'package:base/base.dart';

class EmailAddressValue {
  final String value;

  EmailAddressValue(this.value) : assert(emailValidationError(value) == null);
}