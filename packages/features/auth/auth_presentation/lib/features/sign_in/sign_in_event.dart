part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {}

final class InitiateSignInEvent extends SignInEvent {
  final EmailAddressValue email;
  final String password;

  InitiateSignInEvent({required this.email, required this.password});


}