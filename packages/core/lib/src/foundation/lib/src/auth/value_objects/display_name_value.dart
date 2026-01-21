import 'package:base/base.dart';

class DisplayNameValue {
  final String value;

  DisplayNameValue(this.value) : assert(displayNameValidationError(value) == null);
}