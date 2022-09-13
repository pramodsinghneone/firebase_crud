import 'package:firebase_crud_demo/model/product_model.dart';
import 'package:firebase_crud_demo/presentation/products_page/bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../widgets/edit_dialog.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductsBloc>(context).add(ProductGetData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Firebase Firestore")),
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (_, state) {
          if (state is ProductLoaded) {
            List<ProductModel> data = state.productList;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                var item = data[index];
                return Slidable(
                  key: ValueKey(item.docId),
                  endActionPane: ActionPane(
                    dismissible: DismissiblePane(onDismissed: () {}),
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        borderRadius: BorderRadius.circular(1),
                        autoClose: true,
                        flex: 1,
                        padding: EdgeInsets.all(8),
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        spacing: 8,
                        label: "Delete",
                        onPressed: (context) {
                          BlocProvider.of<ProductsBloc>(context)
                              .add(ProductDeleteEvent(docId: item.docId!));

                          BlocProvider.of<ProductsBloc>(context)
                              .add(ProductGetData());
                        },
                      ),
                      SlidableAction(
                        borderRadius: BorderRadius.circular(1),
                        autoClose: true,
                        flex: 1,
                        spacing: 8,
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        label: "Edit",
                        onPressed: (context) {
                          _openDialog(item);
                        },
                      ),
                    ],
                  ),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(item.name),
                        subtitle: Text("Price ${item.price.toString()}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            _openDialog(item);
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is ProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _create(),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<void> _create() async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext ctx) {
        return Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: const Text('Create'),
                onPressed: () async {
                  final double? price = double.tryParse(priceController.text);
                  if (price != null) {
                    _postData(context);
                    nameController.clear();
                    priceController.clear();
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _postData(BuildContext context) {
    BlocProvider.of<ProductsBloc>(context).add(
      ProductCreate(nameController.text, priceController.text),
    );
  }

  void _openDialog(ProductModel model) {
    showDialog(
        context: context,
        builder: (context) {
          return EditDialog(model: model);
        });
  }
}
