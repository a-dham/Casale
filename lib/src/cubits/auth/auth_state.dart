part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthStateLoading extends AuthState {}

final class AuthStateSuccess extends AuthState {
  AuthStateSuccess({
    required this.loginModel,
  });
  final LoginModel loginModel;
}

final class AuthStateFail extends AuthState {}
