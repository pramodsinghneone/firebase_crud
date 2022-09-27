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

class GoogleSignInLoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class GoogleSignInLoginLoaded extends LoginState {
  final GoogleSignInAccount? signInAccount;

  GoogleSignInLoginLoaded({required this.signInAccount});
  @override
  List<Object> get props => [signInAccount!];
}

class GoogleSignInLoginError extends LoginState {
  final String error;
  GoogleSignInLoginError({required this.error});
  @override
  List<Object> get props => [error];
}
