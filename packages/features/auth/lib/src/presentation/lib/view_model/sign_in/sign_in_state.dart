part of 'sign_in_bloc.dart';

@immutable
sealed class SignInState {}

final class InitialSignInState extends SignInState {}

final class LoadingSignInState extends SignInState {}

final class SuccessSignInState extends SignInState {
  final AppUserEntity user;

  SuccessSignInState({required this.user});
}

final class ErrorSignInState extends SignInState {
  final AppFailure failure;

  ErrorSignInState({required this.failure});
}
