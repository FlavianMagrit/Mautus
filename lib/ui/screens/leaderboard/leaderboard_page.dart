import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../../data/entities/word.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_input.dart';
import 'leaderboard_viewmodel.dart';

class LeaderBoardPage extends StatefulWidget {
  const LeaderBoardPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LeaderBoardPage> createState() => _LeaderBoardPageState();
}

class _LeaderBoardPageState extends State<LeaderBoardPage> {
  @override
  Widget build(BuildContext context) {
    LeaderboardViewModel viewModel = context.read<LeaderboardViewModel>();
    String mystring = 'pkfw';

    List<Widget> lettersList = [];

    viewModel.addListener(() {
      setState(() {
        mystring = viewModel.word.toString();
      });
    });
    viewModel.loadDictionnary();

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
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: HexColor("#013a79"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Consumer<LeaderboardViewModel>(builder: (context, model, child) {
          if (viewModel.word == null) {
            return const CircularProgressIndicator();
          } else {
            return Text('niffl');
          }
        }),
        Row(
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
        ),
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
