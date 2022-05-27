import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key, required this.buttonText, required this.onPressed})
      : super(key: key);
  String buttonText;
  var onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: Colors.white, // Background color
        ),
        onPressed: onPressed,
        icon: const Icon(
          Icons.login_outlined,
        ),
        label: Text(
          buttonText,
          style: TextStyle(color: HexColor("#013a79")),
        ), // <-- Text
      ),
    );
  }
}
