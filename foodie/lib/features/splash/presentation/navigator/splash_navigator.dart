import 'package:finalproject/features/auth/presentation/view/login_view.dart';
import 'package:flutter/material.dart';

void navigateToLogin(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const LoginView()),
  );
}
