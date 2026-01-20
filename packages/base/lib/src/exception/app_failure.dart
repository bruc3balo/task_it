import 'dart:core';

import 'failure_type.dart';
export 'failure_type.dart';

class AppFailure implements Exception {
  final FailureType failureType;
  final dynamic trace;
  final String message;

  AppFailure({this.failureType = FailureType.unknown, this.message = "Oops! Something went wrong", this.trace});
}