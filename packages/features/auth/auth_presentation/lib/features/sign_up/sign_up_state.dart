part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpState {}

final class InitialSignUpState extends SignUpState {}

final class LoadingSignUpState extends SignUpState {}

final class SuccessSignUpState extends SignUpState {
  final AppUserIdValue user;

  SuccessSignUpState({required this.user});
}

final class ErrorSignUpState extends SignUpState {
  final AppFailure failure;

  ErrorSignUpState(this.failure);
}
