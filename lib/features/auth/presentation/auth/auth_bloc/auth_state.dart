part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthError extends AuthState {
  final String errorText;
  const AuthError(
    this.errorText,
  );

  @override
  List<Object> get props => [
        errorText,
      ];
}

final class AuthLoaded extends AuthState {
  const AuthLoaded();

  @override
  List<Object> get props => [];
}
