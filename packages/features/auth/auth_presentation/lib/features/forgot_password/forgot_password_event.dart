part of 'forgot_password_bloc.dart';

@immutable
sealed class ForgotPasswordEvent {}

final class InitiateForgotPasswordEvent extends ForgotPasswordEvent {
  final EmailAddressValue email;

  InitiateForgotPasswordEvent(this.email);
}