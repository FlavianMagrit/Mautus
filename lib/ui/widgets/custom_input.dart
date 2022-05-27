import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomInput extends StatelessWidget {
  CustomInput({
    Key? key,
    required this.inputLabel,
    required this.controller,
    this.keyboardType,
    this.obscureText = true,
    this.enableSuggestions = false,
    this.autocorrect = false,
  }) : super(key: key);

  String inputLabel;
  var controller;
  var keyboardType;
  bool obscureText;
  bool enableSuggestions;
  bool autocorrect;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscureText,
        enableSuggestions: enableSuggestions,
        autocorrect: autocorrect,
        decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
            )),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
