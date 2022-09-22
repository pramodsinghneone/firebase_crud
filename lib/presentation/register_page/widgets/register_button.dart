import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/registration/bloc/registration_bloc.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (context.read<RegistrationBloc>().emailController.text.isEmpty &&
            context.read<RegistrationBloc>().passwordController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please fill all details')));
          return;
        }
        BlocProvider.of<RegistrationBloc>(context).add(RegistrationGetEvent(
          email: context.read<RegistrationBloc>().emailController.text,
          password: context.read<RegistrationBloc>().passwordController.text,
        ));
      },
      child: const Text('Register'),
    );
  }
}
