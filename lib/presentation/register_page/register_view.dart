import 'package:firebase_crud_demo/presentation/login/login_view.dart';
import 'package:firebase_crud_demo/presentation/register_page/widgets/register_button.dart';
import 'package:firebase_crud_demo/view_model/registration/bloc/registration_bloc.dart';
import 'package:firebase_crud_demo/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registeration'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          TextFormWidget(
            controller: context.read<RegistrationBloc>().emailController,
            lableText: 'Email',
          ),
          TextFormWidget(
            controller: context.read<RegistrationBloc>().passwordController,
            lableText: 'Password',
          ),
          const SizedBox(height: 30),
          BlocConsumer<RegistrationBloc, RegistrationState>(
            buildWhen: (previous, current) {
              return current is RegistrationLoaded ||
                  current is RegistrationError ||
                  current is RegistrationLoading;
            },
            listenWhen: (previous, current) {
              return current is RegistrationLoaded ||
                  current is RegistrationError;
            },
            listener: (context, state) {
              if (state is RegistrationLoaded) {
                if (state.resMsg == 'registered') {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Registered Successfully')));
                  context.read<RegistrationBloc>().emailController.clear();
                  context.read<RegistrationBloc>().passwordController.clear();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const LoginView()));
                }
              }
              if (state is RegistrationError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorMsg)));
              }
            },
            builder: (context, state) {
              if (state is RegistrationInitial) {
                return const RegisterButton();
              } else if (state is RegistrationLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is RegistrationLoaded) {
                return const RegisterButton();
              } else if (state is RegistrationError) {
                return const Text('Register Failed');
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
