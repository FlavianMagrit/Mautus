import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mautus_flutter/ui/widgets/leaderboard_screen.dart';

import '../../widgets/custom_bottom_nav_bar.dart';
import '../../widgets/game_screen.dart';
import '../../widgets/profile_screen.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 1;

  static final List<StatefulWidget> _widgets = [
    const LeaderboardScreen(),
    const GameScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _widgets[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(onCLick: (index) {
        setState(() {
          _currentIndex = index;
        });
      }),
    );
  }
}
