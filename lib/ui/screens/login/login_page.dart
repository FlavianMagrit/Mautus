import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(
          children: <Widget>[
            CustomInput(inputLabel: 'Utilisateur'),
            CustomInput(inputLabel: 'Mot de passe',),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text(
                'Mot de passe oublié ?',
              ),
            ),
            const Text('-OU-'),
            CustomButton(
              buttonText: 'Connexion via Google',
            ),
          ],
        ),
      ]),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  //forgot password screen
                },
                child: const Text(
                  'Mot de passe oublié ?',
                ),
              ),
              TextButton(
                onPressed: () {
                  //forgot password screen
                },
                child: const Text(
                  'Créer un compte',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
