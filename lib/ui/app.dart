import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'screens/home/home_page.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final BeamerDelegate routerDelegate = BeamerDelegate(locationBuilder: RoutesLocationBuilder(
    routes: {
      // '/': (context, state, data) => const SignInSignUpPage(title: 'Connexion'),
      '/': (context, state, data) => const HomePage(title: 'Maumau Mautus',),
      '/home': (context, state, data) => const HomePage(title: 'Maumau Mautus',)
    }
  ));

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
