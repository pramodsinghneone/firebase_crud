import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../widgets/authentication_helper.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthenticationHelper authenticationHelper;
  TextEditingController emailControllerLogin = TextEditingController();
  TextEditingController passwordControllerLogin = TextEditingController();
  LoginBloc({required this.authenticationHelper}) : super(LoginInitial()) {
    on<LoginGetEvent>((event, emit) async {
      try {
        emit(LoginLoading());
        final result = await authenticationHelper.signIn(
            email: event.email, password: event.password);
        if (result == 'loggedIn') {
          emit(LoginLoaded(resMsg: 'loggedIn'));
        } else {
          emit(LoginError(errorMsg: 'Login failed'));
        }
      } catch (e) {
        emit(LoginError(errorMsg: e.toString()));

        print(e.toString());
      }
    });
  }
}
