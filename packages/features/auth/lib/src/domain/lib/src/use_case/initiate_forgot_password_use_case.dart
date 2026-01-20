import 'package:auth_domain/src/value_objects/email_address_value.dart';
import 'package:auth_domain/src/repository/auth_repository.dart';
import 'package:base/base.dart';

class InitiateForgotPasswordUseCase extends BaseUseCase<void, EmailAddressValue> {
  final AuthRepository _authRepository;

  InitiateForgotPasswordUseCase({required AuthRepository authRepository}) : _authRepository = authRepository;

  @override
  Future<TaskResult<void>> execute({required EmailAddressValue params}) async {
    try {
      return await _authRepository.forgotPassword(params);
    } catch (e, trace) {
      return FailedResult(AppFailure(message: e.toString(), trace: trace));
    }
  }
}
