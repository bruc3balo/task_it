import 'package:base/base.dart';

abstract class BaseUseCase<ReturnType, ParamType> {
  Future<TaskResult<ReturnType>> execute({ParamType? params});
}
