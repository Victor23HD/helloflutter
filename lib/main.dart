import 'package:flutter/material.dart';
import 'package:helloflutter/views/home_view.dart';
import 'package:helloflutter/views/login_view.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // DefaultFirebaseOptions.currentPlatform,

  runApp(
    MaterialApp(
      initialRoute: "/login",
      routes: {
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(),
      },
    ),
  );
}
