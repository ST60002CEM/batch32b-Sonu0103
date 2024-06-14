import 'package:finalproject/features/splash/presentation/navigator/splash_navigator.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    // Add a delay to simulate the splash screen duration
    Future.delayed(const Duration(seconds: 2), () {
      // Navigate to the login screen using the function from navigator.dart
      navigateToLogin(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 94, 209, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image at the center
            Image.asset(
              'assets/images/logo2.png', // Replace with your image path
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            // Text "Enjoy your food"
            const Text(
              'Enjoy your food',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Button "Get Started"
            ElevatedButton(
              onPressed: () {
                // Navigate to the login page
                navigateToLogin(context);
              },
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
