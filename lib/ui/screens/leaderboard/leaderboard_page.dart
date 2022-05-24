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
            Text('Leaderboard'),
            Text('Leaderboard 2'),
          ],
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: Colors.blue),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('assets/pictures/play.png'),
              height: 75,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard, color: Colors.blue),
            label: '',
          ),
        ],
      ),
    );
  }
}
