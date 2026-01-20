import 'package:core/core.dart';
import 'package:auth_domain/domain.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AppUserRepository)
class AppUserRepositoryImpl extends AppUserRepository {
  final AppUserDataSource _appUserDataSource;

  AppUserRepositoryImpl({required AppUserDataSource appUserDataSource}) : _appUserDataSource = appUserDataSource;

  @override
  Future<TaskResult<AppUserEntity>> createUser(CreateUserAccountForm form) async {
    try {
      var existingUserResult = await _appUserDataSource.findUserByEmail(form.email);
      switch (existingUserResult) {
        case SuccessResult<AppUserEntity>():
          //Duplicate user
          return FailedResult(AppFailure(failureType: FailureType.duplicate, message: "User already exists", trace: existingUserResult));

        case FailedResult<AppUserEntity>():
          if (existingUserResult.failure.failureType != FailureType.notFound) return FailedResult.fromFailure(existingUserResult);

          //User is not duplicate and account creation can continue
          var now = DateTime.now();
          return await _appUserDataSource.saveUser(
            AppUserEntity(id: form.userId, email: form.email, displayName: form.displayName, createdAt: now, updatedAt: now),
          );
      }
    } catch (e, trace) {
      return FailedResult(AppFailure(trace: trace));
    }
  }

  @override
  Future<TaskResult<AppUserEntity>> findUserById(AppUserIdValue id) async {
    try {
      return await _appUserDataSource.findUserById(id);
    } catch (e, trace) {
      return FailedResult(AppFailure(trace: trace));
    }
  }
}
