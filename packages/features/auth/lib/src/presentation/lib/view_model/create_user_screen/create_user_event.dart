part of 'create_user_bloc.dart';

@immutable
sealed class CreateUserEvent {}

final class InitiateCreateUserEvent extends CreateUserEvent {
  final DisplayNameValue displayNameValue;

  InitiateCreateUserEvent({required this.displayNameValue});
}