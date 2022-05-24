import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key, required this.buttonText}) : super(key: key);
  String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(
          // <-- Icon
          Icons.login_outlined,
        ),
        label: Text(buttonText), // <-- Text
      ),
    );
  }
}
