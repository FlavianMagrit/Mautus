import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mautus_flutter/ui/screens/home/home_viewmodel.dart';
import 'package:mautus_flutter/ui/widgets/custom_row.dart';
import 'package:provider/provider.dart';

class CustomLetter extends StatefulWidget {
  final String mystring;
  int i;
  bool win = false;
  String bgcolor = '#003B79';
  CustomLetter({Key? key, required this.mystring, required this.i}) : super(key: key);

  @override
  State<CustomLetter> createState() => _CustomLetterState();
}

class _CustomLetterState extends State<CustomLetter> {
  void _checkLetter(String letter) {
    HomeViewModel homeViewModel = context.read<HomeViewModel>();
    homeViewModel.incrementString(letter);
    if (letter == widget.mystring[widget.i]) {
      setState(() {
        widget.bgcolor = '#FBBD1B';
      });
      if (widget.i == widget.mystring.length-1) {
        widget.win = true;
      }
    }
    if (widget.i == widget.mystring.length-1) {
      homeViewModel.resetString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      margin: const EdgeInsets.only(left: 2.0, bottom: 3.0),
      alignment: Alignment.center,
      color: HexColor(widget.bgcolor),
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
          _checkLetter(value);
          if (widget.win) {
            context.beamToNamed('/login');
          }
        },
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: '',
        ),
      ));
  }
}
