import 'package:firebase_crud_demo/presentation/products_page/bloc/products_bloc.dart';
import 'package:firebase_crud_demo/presentation/products_page/components/home_list.dart';
import 'package:firebase_crud_demo/repository/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageFormWidget extends StatefulWidget {
  HomePageFormWidget({Key? key}) : super(key: key);

  @override
  State<HomePageFormWidget> createState() => _HomePageFormWidgetState();
}

class _HomePageFormWidgetState extends State<HomePageFormWidget> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsBloc(
        productRepository: RepositoryProvider.of<ProductRepository>(context),
      ),
      child: Scaffold(
        key: scaffoldKey,
        body: BlocListener<ProductsBloc, ProductsState>(
          listener: (context, state) {
            if (state is ProductsAdded) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Product added'),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
          child: BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              if (state is ProductsAdding) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ProductsError) {
                return Center(
                  child: Text('Error ${state.error}'),
                );
              }
              return HomePage();
            },
          ),
        ),
      ),
    );
  }
}
