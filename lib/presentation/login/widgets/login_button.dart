import 'package:firebase_crud_demo/presentation/register_page/register_view.dart';
import 'package:firebase_crud_demo/view_model/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            if (context.read<LoginBloc>().emailControllerLogin.text.isEmpty &&
                context
                    .read<LoginBloc>()
                    .passwordControllerLogin
                    .text
                    .isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please fill all details')));
              return;
            }
            context.read<LoginBloc>().add(LoginGetEvent(
                email: context.read<LoginBloc>().emailControllerLogin.text,
                password:
                    context.read<LoginBloc>().passwordControllerLogin.text));
          },
          child: const Text('Login'),
        ),
        const SizedBox(height: 30),
        SignInButton(
          Buttons.Google,
          text: "Sign In with Google",
          onPressed: () {
            context.read<LoginBloc>().add(GoogleLoginSignInevent());
          },
        ),
        const SizedBox(height: 30),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => RegisterPage()));
            },
            child: const Text('Don\'t have an account? Register here')),
      ],
    );
  }
}
