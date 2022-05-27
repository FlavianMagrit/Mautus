import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mautus_flutter/ui/screens/signin_and_signup/sign_in_and_sign_up_viewmodel.dart';
import 'package:mautus_flutter/ui/widgets/custom_button.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_input.dart';

class SignInSignUpPage extends StatefulWidget {
  const SignInSignUpPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SignInSignUpPage> createState() => _SignInSignUpPage();
}

class _SignInSignUpPage extends State<SignInSignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#013a79"),
      body: Consumer<SignInAndSignUpViewModel>(
          builder: ((context, viewModel, child) {
        viewModel.addListener(() {
          if (viewModel.user != null) {
            context.beamToNamed('/home');
          }
        });
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                  image: AssetImage('assets/pictures/logo.png'),
                  width: 300,
                  height: 300),
              CustomInput(
                inputLabel: '@ Mail',
                controller: emailController,
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
              ),
              CustomInput(
                inputLabel: 'Mot de passe',
                controller: passwordController,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
              CustomButton(
                buttonText: 'Connexion',
                onPressed: () {
                  viewModel.signIn(
                      email: emailController.value.text,
                      password: passwordController.value.text);
                  passwordController.value = TextEditingValue();
                },
              ),
            ],
          ),
        );
      })),
    );
  }
}
