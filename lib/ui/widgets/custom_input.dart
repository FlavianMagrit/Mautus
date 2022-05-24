import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  CustomInput({Key? key, required this.inputLabel}) : super(key: key);
  String inputLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        // controller: nameController,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: inputLabel,
        ),
      ),
    );
  }
}
