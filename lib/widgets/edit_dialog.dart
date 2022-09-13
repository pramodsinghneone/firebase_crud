import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/product_model.dart';
import '../presentation/products_page/bloc/products_bloc.dart';

class EditDialog extends StatefulWidget {
  final ProductModel model;
  const EditDialog({super.key, required this.model});

  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.model.name;
    priceController.text = widget.model.price;
  }

  @override
  Widget build(BuildContext ctx) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 38),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Update Record',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            commonTextField(nameController, 'Name'),
            const SizedBox(height: 20),
            commonTextField(priceController, 'Price'),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Update'),
              onPressed: () {
                if (nameController.text != widget.model.name) {
                  Navigator.of(context).pop();
                  BlocProvider.of<ProductsBloc>(context).add(ProductUpdateEvent(
                      docId: widget.model.docId!,
                      name: nameController.text,
                      price: priceController.text));

                  BlocProvider.of<ProductsBloc>(context).add(ProductGetData());
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget commonTextField(TextEditingController controller, String labelName) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelName,
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
