part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

final class InitiateSignUpEvent extends SignUpEvent {
  final DisplayNameValue displayName;
  final EmailAddressValue email;
  final PasswordValue password;

  InitiateSignUpEvent({required this.displayName, required this.email, required this.password});
}
