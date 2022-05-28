import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/home/home_viewmodel.dart';
import '../screens/signin_and_signup/sign_in_and_sign_up_viewmodel.dart';
import 'custom_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomButton(
        buttonText: 'Déconnexion',
        onPressed: () async {
          await context.read<HomeViewModel>().signOut();
          await context.read<SignInAndSignUpViewModel>().reset();
          context.beamToNamed('/login');
        },
        buttonColor: '#013a79',
        textColor: '#FFFFFF',
      ),
    ]));
  }
}
