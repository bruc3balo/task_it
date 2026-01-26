//@GeneratedMicroModule;AuthPresentationPackageModule;package:auth_presentation/auth_presentation.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:auth_domain/auth_domain.dart' as _i470;
import 'package:auth_presentation/features/auth/auth_bloc.dart' as _i498;
import 'package:auth_presentation/features/create_user/create_user_bloc.dart'
    as _i1040;
import 'package:auth_presentation/features/forgot_password/forgot_password_bloc.dart'
    as _i1063;
import 'package:auth_presentation/features/sign_in/sign_in_bloc.dart' as _i726;
import 'package:auth_presentation/features/sign_up/sign_up_bloc.dart' as _i450;
import 'package:injectable/injectable.dart' as _i526;
import 'package:taskmanager_task_board/taskmanager_task_board.dart' as _i243;

class AuthPresentationPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i726.SignInBloc>(
        () => _i726.SignInBloc(gh<_i470.SignInUseCase>()));
    gh.factory<_i498.AuthBloc>(
        () => _i498.AuthBloc(gh<_i243.AppAuthenticatorService>()));
    gh.factory<_i450.SignUpBloc>(
        () => _i450.SignUpBloc(gh<_i470.SignUpUseCase>()));
    gh.factory<_i1040.CreateUserBloc>(() => _i1040.CreateUserBloc(
          gh<_i470.CreateUserUseCase>(),
          gh<_i470.GetCurrentUserUseCase>(),
        ));
    gh.factory<_i1063.ForgotPasswordBloc>(() =>
        _i1063.ForgotPasswordBloc(gh<_i470.InitiateForgotPasswordUseCase>()));
  }
}
