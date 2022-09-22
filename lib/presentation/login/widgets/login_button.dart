import 'package:firebase_crud_demo/view_model/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (context.read<LoginBloc>().emailControllerLogin.text.isEmpty &&
            context.read<LoginBloc>().passwordControllerLogin.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please fill all details')));
          return;
        }
        context.read<LoginBloc>().add(LoginGetEvent(
            email: context.read<LoginBloc>().emailControllerLogin.text,
            password: context.read<LoginBloc>().passwordControllerLogin.text));
      },
      child: const Text('Login'),
    );
  }
}
