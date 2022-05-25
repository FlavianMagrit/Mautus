import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mautus_flutter/ui/screens/signin_and_signup/sign_in_and_sign_up_viewmodel.dart';
import 'package:provider/provider.dart';

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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Consumer<SignInAndSignUpViewModel>(
        builder: ((context, viewModel, child) {
        viewModel.addListener(() {
          if (viewModel.user != null) {
            context.beamToNamed('/home');
          }
        });
        return Center(
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              TextField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  viewModel.signIn(
                    email: emailController.value.text,
                    password: passwordController.value.text
                  );
                  passwordController.value = TextEditingValue();
                },
                child: const Text('Valider')),
            ],
          ),
        );
      })),
    );
  }
}
