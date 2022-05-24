import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mautus_flutter/ui/screens/leaderboard/leaderboard_page.dart';
import 'package:mautus_flutter/ui/screens/login/login_page.dart';

import '../main.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const LoginPage(title: 'Maumau Mautus'),
      home: const LeaderBoardPage(title: 'leaderboard'),
    );
  }
}
