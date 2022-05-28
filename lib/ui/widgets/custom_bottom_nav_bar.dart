import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomBottomNavBar extends StatelessWidget {
  Function(int p1)? onCLick;

  CustomBottomNavBar({Key? key, this.onCLick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onCLick,
      backgroundColor: HexColor('#013a79'),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.leaderboard, color: Colors.white),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image(
            image: AssetImage('assets/pictures/play.png'),
            height: 100,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle, color: Colors.white),
          label: '',
        ),
      ],
    );
  }
}
