import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'custom_letter.dart';

class CustomRow extends StatefulWidget {
  final String mystring;
  final int rowPos;

  const CustomRow({Key? key, required this.mystring, required this.rowPos}) : super(key: key);

  @override
  State<CustomRow> createState() => _CustomRowState();
}

class _CustomRowState extends State<CustomRow> {
  String response = "";
  @override
  Widget build(BuildContext context) {
    List<Widget> lettersList = [];
    for (int i = 1; i < widget.mystring.length; i++) {
      lettersList.add(CustomLetter(mystring: widget.mystring, letterPos: i, rowPos: widget.rowPos));
    }

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              height: 50,
              width: 50,
              margin: const EdgeInsets.only(left: 2.0, bottom: 3.0),
              alignment: Alignment.center,
              color: HexColor('#FBBD1B'),
              child: Text(
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  '${widget.mystring[0]}'.toUpperCase())),
          Row(children: lettersList),
        ],
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue,
      TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
