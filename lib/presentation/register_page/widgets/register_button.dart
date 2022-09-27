import 'package:firebase_crud_demo/presentation/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/registration/bloc/registration_bloc.dart';

class RegisterButton extends StatelessWidget {
  VoidCallback onLoginClick;
  RegisterButton({super.key, required this.onLoginClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            if (context.read<RegistrationBloc>().emailController.text.isEmpty &&
                context
                    .read<RegistrationBloc>()
                    .passwordController
                    .text
                    .isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please fill all details')));
              return;
            }
            BlocProvider.of<RegistrationBloc>(context).add(RegistrationGetEvent(
              email: context.read<RegistrationBloc>().emailController.text,
              password:
                  context.read<RegistrationBloc>().passwordController.text,
            ));
          },
          child: const Text('Register'),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
            onPressed: onLoginClick, child: const Text('Go to Login Page')),
      ],
    );
  }
}
