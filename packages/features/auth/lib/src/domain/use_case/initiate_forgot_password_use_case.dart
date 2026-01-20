import 'package:auth/src/domain/entities/app_user_entity.dart';
import 'package:auth/src/domain/forms/create_new_account_form.dart';
import 'package:auth/src/domain/forms/create_new_user_form.dart';
import 'package:auth/src/domain/forms/login_form.dart';
import 'package:auth/src/domain/repository/app_user_repository.dart';
import 'package:auth/src/domain/repository/auth_repository.dart';
import 'package:auth/src/domain/value_objects/app_user_id_value.dart';
import 'package:auth/src/domain/value_objects/email_address_value.dart';
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
