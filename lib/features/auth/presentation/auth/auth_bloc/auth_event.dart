part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthLoginEvent extends AuthEvent {
  final String login;
  final String password;
  const AuthLoginEvent({
    required this.login,
    required this.password,
  });

  @override
  List<Object> get props => [
        login,
        password,
      ];
}
