import 'package:core/core.dart';
import 'package:auth_domain/src/repository/_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SignUpUseCase extends BaseUseCase<AppUserIdValue, SignUpForm> {
  final AuthRepository _authRepository;

  SignUpUseCase({required AuthRepository authRepository}) : _authRepository = authRepository;

  @override
  Future<TaskResult<AppUserIdValue>> execute({required SignUpForm params}) async {
    try {
      return await _authRepository.signUp(params);
    } catch (e, trace) {
      return FailedResult(AppFailure(message: e.toString(), trace: trace));
    }
  }

}
