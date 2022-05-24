import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mautus_flutter/ui/screens/login/login_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(title: 'Maumau Mautus'),
      // home: const LeaderBoardPage(title: 'leaderboard'),
      // home: const HomePage(title: 'Maumau Mautus'),
    );
  }
}
