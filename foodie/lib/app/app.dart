import 'package:flutter/material.dart';
import 'package:foodie/screen/dashboard_screen.dart';
import 'package:foodie/screen/login.dart';
import 'package:foodie/screen/signup_screen.dart';
import 'package:foodie/screen/splash_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    );
  }
}
