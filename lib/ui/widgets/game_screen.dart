import 'package:flutter/material.dart';
import 'package:mautus_flutter/ui/widgets/custom_grid.dart';
import 'package:provider/provider.dart';

import '../screens/home/home_viewmodel.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = context.read<HomeViewModel>();
    // viewModel.loadLocalDictionary();
    viewModel.loadFirestoreDictionary();
    String? mystring = viewModel.word?.text;
    mystring ??= 'chien';
    mystring = viewModel.removeDiacritics(mystring).toUpperCase();
    print(mystring);

    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Consumer<HomeViewModel>(builder: (context, model, child) {
          if (viewModel.gameState == 'win') {
            return Center(
                child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 15.0),
                  child: Text('LEEEEESSSSGGGGOOOOO',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                Image.asset(
                  "assets/pictures/win.gif",
                  height: 350.0,
                  width: 350.0,
                ),
              ],
            ));
          } else if (viewModel.gameState == 'loose') {
            return Center(
                child: Column(
              children: [
                Text('Le mot du jour était:'),
                Text(viewModel.word!.text!.toUpperCase()),
                Image.asset(
                  "assets/pictures/loose.gif",
                  height: 400.0,
                  width: 400.0,
                ),
              ],
            ));
          } else {
            if (viewModel.word == null) {
              return const CircularProgressIndicator();
            } else {
              return Container(
                child: Column(
                  children: [
                    Text('Le mot du jour :'),
                    CustomGrid(mystring: mystring!),
                  ],
                ),
              );
            }
          }
        })
      ]),
    );
  }
}
