import 'package:flutter/material.dart';
import 'package:foodie/screen/login.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });

    return Scaffold(
      backgroundColor: Color.fromRGBO(30, 94, 209, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image at the center
            Image.asset(
              'assets/images/new.jpg', // Replace with your image path
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            // Text "Enjoy your food"
            Text(
              'Enjoy your food',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Button "Get Started"
            ElevatedButton(
              onPressed: () {
                // Navigate to the login page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
