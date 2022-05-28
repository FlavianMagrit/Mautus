import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mautus_flutter/ui/screens/home/home_viewmodel.dart';
import 'package:mautus_flutter/ui/widgets/leaderboard_screen.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_bottom_nav_bar.dart';
import '../../widgets/game_screen.dart';
import '../../widgets/profile_screen.dart';
import '../signin_and_signup/sign_in_and_sign_up_viewmodel.dart';

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
        automaticallyImplyLeading: false,
        backgroundColor: HexColor("#013a79"),
        title: Row(
          children: [
            Text(widget.title),
            IconButton(onPressed: () async {
              await context.read<HomeViewModel>().signOut();
              await context.read<SignInAndSignUpViewModel>().reset();
              context.beamToNamed('/login');
            }, icon: const Icon(Icons.logout)),
          ],
        ),
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