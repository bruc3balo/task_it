part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

final class InitiateSignUpEvent extends SignUpEvent {
  final EmailAddressValue email;
  final PasswordValue password;

  InitiateSignUpEvent({required this.email, required this.password});
}
