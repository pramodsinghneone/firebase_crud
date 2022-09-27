part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class RegistrationGetEvent extends RegistrationEvent {
  final String email;
  final String password;

  RegistrationGetEvent({required this.email, required this.password});
  @override
  List<Object> get props => [email, password];
}

class GoogleSignInEvent extends RegistrationEvent {
  @override
  List<Object> get props => [];
}

class GoogleSignOutEvent extends RegistrationEvent {
  @override
  List<Object> get props => [];
}
