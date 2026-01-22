//@GeneratedMicroModule;AuthPackageModule;package:auth/src/auth_base.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:auth/src/data/lib/src/repository_impl/app_user_repository_impl.dart'
    as _i42;
import 'package:auth/src/data/lib/src/repository_impl/auth_repository_impl.dart'
    as _i116;
import 'package:auth/src/domain/lib/src/use_case/create_user_use_case.dart'
    as _i241;
import 'package:auth/src/domain/lib/src/use_case/get_current_user_use_case.dart'
    as _i221;
import 'package:auth/src/domain/lib/src/use_case/initiate_forgot_password_use_case.dart'
    as _i261;
import 'package:auth/src/domain/lib/src/use_case/sign_in_use_case.dart'
    as _i862;
import 'package:auth/src/domain/lib/src/use_case/sign_up_use_case.dart'
    as _i621;
import 'package:auth/src/presentation/lib/view_model/create_user/create_user_bloc.dart'
    as _i488;
import 'package:auth/src/presentation/lib/view_model/forgot_password/forgot_password_bloc.dart'
    as _i57;
import 'package:auth/src/presentation/lib/view_model/sign_in/sign_in_bloc.dart'
    as _i440;
import 'package:auth/src/presentation/lib/view_model/sign_up/sign_up_bloc.dart'
    as _i861;
import 'package:auth_domain/domain.dart' as _i952;
import 'package:auth_domain/src/repository/_repository.dart' as _i546;
import 'package:auth_domain/src/repository/auth_repository.dart' as _i69;
import 'package:core/core.dart' as _i494;
import 'package:injectable/injectable.dart' as _i526;

class AuthPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.lazySingleton<_i952.AppUserRepository>(() => _i42.AppUserRepositoryImpl(
        appUserDataSource: gh<_i494.AppUserDataSource>()));
    gh.factory<_i861.SignUpBloc>(
        () => _i861.SignUpBloc(gh<_i952.SignUpUseCase>()));
    gh.lazySingleton<_i241.CreateUserUseCase>(() => _i241.CreateUserUseCase(
          appUserRepository: gh<_i952.AppUserRepository>(),
          authenticatorService: gh<_i494.AppAuthenticatorService>(),
        ));
    gh.lazySingleton<_i221.GetCurrentUserUseCase>(
        () => _i221.GetCurrentUserUseCase(
              appUserRepository: gh<_i952.AppUserRepository>(),
              authenticatorService: gh<_i494.AppAuthenticatorService>(),
            ));
    gh.factory<_i440.SignInBloc>(
        () => _i440.SignInBloc(gh<_i952.SignInUseCase>()));
    gh.lazySingleton<_i952.AuthRepository>(() => _i116.AuthRepositoryImpl(
        authenticatorService: gh<_i494.AppAuthenticatorService>()));
    gh.lazySingleton<_i261.InitiateForgotPasswordUseCase>(() =>
        _i261.InitiateForgotPasswordUseCase(
            authRepository: gh<_i69.AuthRepository>()));
    gh.factory<_i57.ForgotPasswordBloc>(() =>
        _i57.ForgotPasswordBloc(gh<_i952.InitiateForgotPasswordUseCase>()));
    gh.factory<_i488.CreateUserBloc>(() => _i488.CreateUserBloc(
          gh<_i952.CreateUserUseCase>(),
          gh<_i952.GetCurrentUserUseCase>(),
        ));
    gh.lazySingleton<_i862.SignInUseCase>(() => _i862.SignInUseCase(
          authRepository: gh<_i546.AuthRepository>(),
          appUserRepository: gh<_i546.AppUserRepository>(),
        ));
    gh.lazySingleton<_i621.SignUpUseCase>(
        () => _i621.SignUpUseCase(authRepository: gh<_i546.AuthRepository>()));
  }
}
