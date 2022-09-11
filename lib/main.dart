import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crud_demo/firebase_options.dart';
import 'package:firebase_crud_demo/presentation/home_page.dart';
import 'package:firebase_crud_demo/repository/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (BuildContext context) => ProductRepository(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Firebase Crud',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePageFormWidget(),
      ),
    );
  }
}
