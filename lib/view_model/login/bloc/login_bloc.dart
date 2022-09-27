import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

    on<GoogleLoginSignInevent>(
      (event, emit) async {
        try {
          emit(LoginLoading());
          var accountDetails = await authenticationHelper.handleGoogleSignIn();
          if (accountDetails != null) {
            print('google signed in successfully');
            emit(LoginLoaded(resMsg: 'loggedIn'));
          } else {
            // emit(GoogleSignInLoginError(error: 'not able to detect account'));
            emit(LoginError(errorMsg: 'Login failed'));
          }
        } catch (e) {
          // emit(GoogleSignInLoginError(error: e.toString()));
          emit(LoginError(errorMsg: e.toString()));
        }
      },
    );
  }
}
