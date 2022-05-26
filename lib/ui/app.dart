import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:mautus_flutter/ui/screens/leaderboard/leaderboard_page.dart';
import 'package:mautus_flutter/ui/screens/signin_and_signup/sign_in_and_sign_up_page.dart';

import 'screens/home/home_page.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final BeamerDelegate routerDelegate = BeamerDelegate(locationBuilder: RoutesLocationBuilder(
    routes: {
      '/': (context, state, data) => const SignInSignUpPage(title: 'Connexion'),
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
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
    );
  }
}
