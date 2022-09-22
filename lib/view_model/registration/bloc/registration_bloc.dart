import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_crud_demo/widgets/authentication_helper.dart';
import 'package:flutter/material.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  AuthenticationHelper authenticationHelper;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RegistrationBloc({required this.authenticationHelper})
      : super(RegistrationInitial()) {
    on<RegistrationGetEvent>((event, emit) async {
      try {
        emit(RegistrationLoading());
        final result = await authenticationHelper.signUp(
            email: event.email, password: event.password);
        if (result == 'registered') {
          emit(RegistrationLoaded(resMsg: 'registered'));
        } else {
          emit(RegistrationError(errorMsg: 'Registration failed'));
        }
      } catch (e) {
        emit(RegistrationError(errorMsg: e.toString()));

        print(e.toString());
      }
    });
  }
}
