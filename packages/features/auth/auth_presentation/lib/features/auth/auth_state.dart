part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class InitialAuthState extends AuthState {}

final class LoadingAuthState extends AuthState {}

final class AuthenticatedAuthState extends AuthState {}

final class NotAuthenticatedAuthState extends AuthState {}

