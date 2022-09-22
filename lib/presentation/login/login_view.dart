import 'package:firebase_crud_demo/presentation/login/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/registration/bloc/registration_bloc.dart';
import '../../widgets/text_form_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          TextFormWidget(
            controller: context.read<RegistrationBloc>().emailControllerLogin,
            lableText: 'Email',
          ),
          TextFormWidget(
            controller:
                context.read<RegistrationBloc>().passwordControllerLogin,
            lableText: 'Password',
          ),
          const SizedBox(height: 30),
          const LoginButton(),
        ],
      ),
    );
  }
}
