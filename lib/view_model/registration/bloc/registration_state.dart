part of 'registration_bloc.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

class RegistrationInitial extends RegistrationState {
  @override
  List<Object> get props => [];
}

class RegistrationLoading extends RegistrationState {
  @override
  List<Object> get props => [];
}

class RegistrationLoaded extends RegistrationState {
  final String resMsg;
  RegistrationLoaded({required this.resMsg});
  @override
  List<Object> get props => [resMsg];
}

class RegistrationError extends RegistrationState {
  final String errorMsg;
  RegistrationError({required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}
