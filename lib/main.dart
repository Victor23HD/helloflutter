import 'package:flutter/material.dart';
import 'package:helloflutter/views/home_view.dart';
import 'package:helloflutter/views/login_view.dart';

void main() {
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



