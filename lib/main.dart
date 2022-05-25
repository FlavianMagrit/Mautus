import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mautus_flutter/data/entities/word.dart';
import 'package:mautus_flutter/ui/app.dart';
import 'package:mautus_flutter/ui/screens/signin_and_signup/sign_in_and_sign_up_viewmodel.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(WordAdapter());
  runApp(
    MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (_) => MyHomeViewModel()),
        ChangeNotifierProvider(create: (_) => SignInAndSignUpViewModel()),
      ],
      child: App(),
    ),
  );
}
