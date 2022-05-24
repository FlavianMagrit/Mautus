import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_input.dart';

class LeaderBoardPage extends StatefulWidget {
  const LeaderBoardPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LeaderBoardPage> createState() => _LeaderBoardPageState();
}

class _LeaderBoardPageState extends State<LeaderBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(
          children: <Widget>[
            Row(
              children: [
                Container(
                    height: 50,
                    width: 50,
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.center,
                    color: Colors.red,
                    child: TextField(
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      onChanged: (value) {
                        value.length == 1 && FocusScope.of(context).nextFocus();
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        counterText: '',
                      ),
                    )),
                Container(
                    alignment: Alignment.center,
                    color: Colors.red,
                    height: 50,
                    width: 50,
                    child: TextField(
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      onChanged: (value) {
                        value.length == 1 && FocusScope.of(context).nextFocus();
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        counterText: '',
                      ),
                    )),
              ],
            )
          ],
        ),
      ]),
    );
  }
}
