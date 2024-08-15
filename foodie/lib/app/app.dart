import 'package:finalproject/app/navigator_key/navigator_key.dart';
import 'package:finalproject/features/auth/presentation/view/login_view.dart';
import 'package:finalproject/features/auth/presentation/view/register_view.dart';
import 'package:finalproject/features/dashboard/presentation/view/dashboard_view.dart';
import 'package:finalproject/features/home/presentation/view/dashboard_view.dart';
import 'package:finalproject/features/home/presentation/view/screen/nav_bar_screen.dart';
import 'package:finalproject/features/splash/presentation/view/splash_view.dart';
// import 'package:finalproject/screen/internet_checker_view.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppNavigator.navigatorKey,
      debugShowCheckedModeBanner: false,
      home: const BottomNavBar(),
    );
  }
}
