part of 'forgot_password_bloc.dart';

@immutable
sealed class ForgotPasswordState {}

final class InitialForgotPasswordState extends ForgotPasswordState {}

final class LoadingForgotPasswordState extends ForgotPasswordState {}

final class SuccessForgotPasswordState extends ForgotPasswordState {}

final class ErrorForgotPasswordState extends ForgotPasswordState {
  final AppFailure failure;

  ErrorForgotPasswordState({required this.failure});
}
