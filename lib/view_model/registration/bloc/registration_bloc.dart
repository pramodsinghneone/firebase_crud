import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_crud_demo/widgets/authentication_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

    on<GoogleSignInEvent>((event, emit) async {
      try {
        emit(GoogleSignInLoading());
        var accountDetails = await authenticationHelper.handleGoogleSignIn();
        if (accountDetails != null) {
          print('google signed in successfully');
          emit(GoogleSignInLoaded(signInAccount: accountDetails));
        } else {
          emit(GoogleSignInError(error: 'not able to detect account'));
        }
      } catch (e) {
        emit(GoogleSignInError(error: e.toString()));
      }
    });
    on<GoogleSignOutEvent>((event, emit) async {
      try {
        emit(GoogleSignInLoading());
        await authenticationHelper.googleSignOut();
        emit(GoogleSignOut(message: 'Sign out Success'));
      } catch (e) {
        emit(GoogleSignInError(error: e.toString()));
      }
    });
  }
}
