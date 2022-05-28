import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      required this.buttonText,
      required this.onPressed,
      required this.buttonColor,
      required this.textColor})
      : super(key: key);
  String buttonText;
  var onPressed;
  String buttonColor;
  String textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: HexColor(buttonColor), // Background color
        ),
        onPressed: onPressed,
        icon: const Icon(
          Icons.login_outlined,
          color: Colors.white,
        ),
        label: Text(
          buttonText,
          style: TextStyle(color: HexColor(textColor)),
        ), // <-- Text
      ),
    );
  }
}
