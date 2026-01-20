part of 'create_user_bloc.dart';

@immutable
sealed class CreateUserState {}

final class InitialCreateUserState extends CreateUserState {}

final class ReadyToCreateUserState extends CreateUserState {}

final class AlreadyCreatedUserState extends CreateUserState {
  final AppUserEntity user;

  AlreadyCreatedUserState(this.user);
}

final class LoadingCreateUserState extends CreateUserState {}

final class SuccessCreateUserState extends CreateUserState {
  final AppUserEntity user;

  SuccessCreateUserState(this.user);
}

final class ErrorCreateUserState extends CreateUserState {
  final AppFailure failure;

  ErrorCreateUserState(this.failure);
}
