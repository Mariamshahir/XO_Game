import 'package:flutter/material.dart';
import 'package:xogame/login.dart';
import 'package:xogame/spalsh.dart';
import 'xoscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Basics",
      routes: {
        Splash.routeName:(_) => Splash(),
        LogIn.routeName: (_) => LogIn(),
        XOScreen.routeName: (context) => XOScreen(),
      },
      initialRoute: Splash.routeName,
    );
  }
}
