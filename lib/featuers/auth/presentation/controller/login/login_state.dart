part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginStateInitial extends LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateSuccess extends LoginState {
  final String role;
  const LoginStateSuccess(this.role);
}

class LoginStateError extends LoginState {
  final String message;
  const LoginStateError(this.message);
}
