import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/home.dart';
import '../../widgets/leaderboard.dart';
import '../../widgets/profile.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  final List<Widget> _bodyCounter = [
    Home(),
    Leaderboard(),
    Profile(),
  ];

  void _changeBody(int index) {
    setState(() {
      _counter = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _bodyCounter[_counter],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _changeBody,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            // icon: Icon(Icons.account_circle, color: Colors.blue),
            icon: Icon(Icons.leaderboard, color: Colors.blue),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image(image: AssetImage('assets/pictures/play.png'), height: 75,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: Colors.blue),
            label: '',
          ),
        ],
      ),
    );
  }
}
