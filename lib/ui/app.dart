import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mautus_flutter/ui/screens/home/loose_page.dart';
import 'package:mautus_flutter/ui/screens/home/win_page.dart';
import 'package:mautus_flutter/ui/screens/signin_and_signup/sign_in_and_sign_up_page.dart';

import 'screens/home/home_page.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final BeamerDelegate routerDelegate = BeamerDelegate(
      locationBuilder: RoutesLocationBuilder(routes: {
    // '/': (context, state, data) => const SignInSignUpPage(title: 'Connexion'),
    '/login': (context, state, data) => const SignInSignUpPage(title: 'Connexion'),
    '/': (context, state, data) => const HomePage(
          title: 'Maumau Mautus',
        ),
    '/home': (context, state, data) => const HomePage(title: 'Maumau Mautus'),
    '/win': (context, state, data) => const WinPage(),
    '/loose': (context, state, data) => const LoosePage(),
  }));

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
      backButtonDispatcher:
          BeamerBackButtonDispatcher(delegate: routerDelegate),
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: HexColor("#013a79"),
      ),
      darkTheme: ThemeData(
        primaryColor: HexColor("#fed202"),
        // primaryColor: HexColor("#fabc1b"),
      ),
    );
  }
}
