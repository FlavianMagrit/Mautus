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
    viewModel.loadDictionnary();

    String mystring = viewModel.word.toString().toUpperCase();
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('Le mot du jour :'),
        // Text(mystring),
        Consumer<HomeViewModel>(builder: (context, model, child) {
          if (viewModel.gameState == 'win') {
            return Center(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/pictures/win.gif",
                      height: 125.0,
                      width: 125.0,
                    ),
                    Text('Le mot du jour était'),
                    Text(viewModel.word!),
                  ],
                )
            );
          } else if (viewModel.gameState == 'loose') {
            return Center(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/pictures/loose.gif",
                      height: 125.0,
                      width: 125.0,
                    ),
                    Text('Le mot du jour était'),
                    Text(viewModel.word!),
                  ],
                )
            );
          } else {
            if (viewModel.word == null) {
              return const CircularProgressIndicator();
            } else {
              return CustomGrid(mystring: mystring);
            }
          }
        })
      ]),
    );
  }
}
