import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomRow extends StatefulWidget {
  final String mystring;
  String color = '#0FF000';

  CustomRow({Key? key, required this.mystring}) : super(key: key);

  @override
  State<CustomRow> createState() => _CustomRowState();
}

class _CustomRowState extends State<CustomRow> {
  String? response = "";

  @override
  Widget build(BuildContext context) {
    print("response: $response");

    if (widget.mystring == response) {
      print('well done');
    } else {
      print('la belle mere a bea');
    }

    List<Widget> lettersList = [];

    void _incrementString(String letter, int i) {
      setState(() {
        if (response!.isEmpty) {
          if (widget.mystring != 'null') {
            response = (response! + widget.mystring[0].toUpperCase());
          }
        }
        response = response! + letter;

        print('reponseSetState: $response');
      }
      );
      if (response![i] == widget.mystring[i]) {
        widget.color = '#FF0000';
      }
    }

    print('reponse: $response');
    for (int i = 1; i < widget.mystring.length; i++) {
      print('widget.mystring[i]: ${widget.mystring[i]}');
      lettersList.add(
        Container(
            height: 50,
            width: 50,
            margin: const EdgeInsets.only(left: 2.0, bottom: 3.0),
            alignment: Alignment.center,
            color: HexColor(widget.color),
            child: TextField(
              inputFormatters: [
                UpperCaseTextFormatter(),
              ],
              textAlign: TextAlign.center,
              maxLength: 1,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              onChanged: (value) {
                value.length == 1 && FocusScope.of(context).nextFocus();
                _incrementString(value, i);
              },
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: '',
              ),
            )),
      );
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
              color: HexColor("#013a79"),
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
