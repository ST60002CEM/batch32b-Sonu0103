import 'package:finalproject/app/navigator_key/navigator_key.dart';
import 'package:finalproject/features/splash/presentation/view/splash_view.dart';
import 'package:finalproject/screen/internet_checker_view.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppNavigator.navigatorKey,
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
