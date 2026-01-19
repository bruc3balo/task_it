import 'dart:core';

import 'failure_type.dart';
export 'failure_type.dart';

class AppFailure implements Exception {
  final FailureType failureType;
  final String message;

  AppFailure({required this.failureType, this.message = "Oops! Something went wrong"});
}