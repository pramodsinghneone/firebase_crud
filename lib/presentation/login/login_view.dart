import 'package:firebase_crud_demo/presentation/home_page.dart';
import 'package:firebase_crud_demo/presentation/login/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/login/bloc/login_bloc.dart';
import '../../view_model/registration/bloc/registration_bloc.dart';
import '../../widgets/text_form_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    super.initState();
    context.read<LoginBloc>().emit(LoginInitial());
  }

  @override
  void dispose() {
    // context.read<LoginBloc>().emit(LoginInitial());
    super.dispose();
  }

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
            controller: context.read<LoginBloc>().emailControllerLogin,
            lableText: 'Email',
          ),
          TextFormWidget(
            controller: context.read<LoginBloc>().passwordControllerLogin,
            lableText: 'Password',
          ),
          const SizedBox(height: 30),
          BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginLoaded) {
                if (state.resMsg == 'loggedIn') {
                  // ScaffoldMessenger.of(context)
                  //     .showSnackBar(const SnackBar(content: Text('Logged In')));
                  context.read<LoginBloc>().emailControllerLogin.clear();
                  context.read<LoginBloc>().passwordControllerLogin.clear();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => HomePageFormWidget()));
                }
              }
              if (state is LoginError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorMsg)));
              }
            },
            builder: (context, state) {
              if (state is LoginInitial) {
                return const LoginButton();
              } else if (state is LoginLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is LoginLoaded) {
                return const LoginButton();
              } else if (state is LoginError) {
                return Text(state.errorMsg);
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
