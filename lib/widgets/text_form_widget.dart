import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? lableText;
  const TextFormWidget({
    Key? key,
    this.controller,
    this.lableText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: lableText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 1.0,
              color: Colors.green,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 1.0,
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 1.0,
              color: Colors.orange,
            ),
          ),
        ),
      ),
    );
  }
}
