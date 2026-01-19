import 'package:base/src/exception/_exception.dart';

sealed class TaskResult<T> {}

class SuccessResult<T> extends TaskResult {
  final T result;
  final String message;

  SuccessResult({required this.result, this.message = "Success"});
}

class FailedResult<T> extends TaskResult {
  final AppFailure failure;

  FailedResult(this.failure);
}
