import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../screens/home/home_viewmodel.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = context.read<HomeViewModel>();
    viewModel.loadDictionnary();
    String mystring = viewModel.word.toString();

    List<Widget> lettersList = [];

    for (int i = 1; i < mystring.length; i++) {
      lettersList.add(
        Container(
            height: 50,
            width: 50,
            margin: const EdgeInsets.only(left: 2.0),
            alignment: Alignment.center,
            color: HexColor("#013a79"),
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
              },
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: '',
              ),
            )),
      );
    }

    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Le mot du jour :'),
        Consumer<HomeViewModel>(builder: (context, model, child) {
          if (viewModel.word == null) {
            return const CircularProgressIndicator();
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  margin: const EdgeInsets.only(left: 2.0),
                  alignment: Alignment.center,
                  color: HexColor("#013a79"),
                  child: Text(
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    '${mystring[0]}'.toUpperCase())),
                Row(
                  children: lettersList,
                ),
              ],
            );
          }
        })
      ]),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
