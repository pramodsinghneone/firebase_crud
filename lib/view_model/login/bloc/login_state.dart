part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoaded extends LoginState {
  final String resMsg;
  LoginLoaded({required this.resMsg});
  @override
  List<Object> get props => [resMsg];
}

class LoginError extends LoginState {
  final String errorMsg;
  LoginError({required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}
