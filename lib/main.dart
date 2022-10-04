import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_crud_demo/firebase_options.dart';
import 'package:firebase_crud_demo/presentation/home_page.dart';
import 'package:firebase_crud_demo/presentation/products_page/bloc/products_bloc.dart';
import 'package:firebase_crud_demo/presentation/register_page/register_view.dart';
import 'package:firebase_crud_demo/repository/product_repository.dart';
import 'package:firebase_crud_demo/view_model/login/bloc/login_bloc.dart';
import 'package:firebase_crud_demo/view_model/registration/bloc/registration_bloc.dart';
import 'package:firebase_crud_demo/widgets/authentication_helper.dart';
import 'package:firebase_crud_demo/widgets/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    BlocOverrides.runZoned(
      () => runApp(const MyApp()),
      blocObserver: BlocHomeObserver(),
    );
  }, (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (BuildContext context) => ProductRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductsBloc(
              productRepository:
                  RepositoryProvider.of<ProductRepository>(context),
            ),
          ),
          BlocProvider<RegistrationBloc>(
            create: (context) => RegistrationBloc(
              authenticationHelper: AuthenticationHelper(),
            ),
          ),
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(
              authenticationHelper: AuthenticationHelper(),
            ),
          ),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Firebase Crud',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // home: HomePageFormWidget(),
          home: RegisterPage(),
        ),
      ),
    );
  }
}
