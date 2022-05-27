import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mautus_flutter/ui/screens/home/home_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_bottom_nav_bar.dart';

class WinPage extends StatelessWidget {
  const WinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = context.read<HomeViewModel>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: HexColor("#013a79"),
        title: Row(
          children: const [
            Text('Bravo !')
          ],
        ),
      ),
      body: Center(
          child: Column(
            children: [
              Image.asset(
                "assets/pictures/win.gif",
                height: 125.0,
                width: 125.0,
              ),
              Text('Le mot du jour était'),
              Text(homeViewModel.word!),
            ],
          )
      ),
      bottomNavigationBar: CustomBottomNavBar(onCLick: (index) {
        context.beamToNamed('/home');
      }),
    );
  }
}