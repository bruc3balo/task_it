import 'package:auth_domain/auth_domain.dart';
import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SignInUseCase extends BaseUseCase<AppUserIdValue, SignInForm> {
  final AuthRepository _authRepository;

  SignInUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<TaskResult<AppUserIdValue>> execute({required SignInForm params}) async {
    try {
      return await _authRepository.signIn(params);
    } catch (e, trace) {
      return FailedResult(AppFailure(message: e.toString(), trace: trace));
    }
  }
}
