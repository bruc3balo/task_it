import 'package:base/src/exception/_exception.dart';

sealed class TaskResult<T> {}

class FailedResult<T> extends TaskResult<T> {
  final AppFailure failure;

  FailedResult(this.failure);

  factory FailedResult.fromFailure(FailedResult result) {
    return FailedResult(result.failure);
  }
}

class SuccessResult<T> extends TaskResult<T> {
  final T result;
  final String message;

  SuccessResult({required this.result, this.message = "Success"});
}


