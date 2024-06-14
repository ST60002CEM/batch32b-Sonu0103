import 'package:finalproject/app/navigator/navigator.dart';
import 'package:finalproject/features/auth/presentation/navigator/login_navigator.dart';
import 'package:finalproject/features/auth/presentation/view/login_view.dart';
import 'package:finalproject/features/auth/presentation/view/register_view.dart';
import 'package:finalproject/features/home/presentation/view/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// void navigateToLogin(BuildContext context) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => const LoginView()),
//   );
// }

// void navigateToRegister(BuildContext context) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => const RegisterView()),
//   );
// }

// // Add other navigation functions as needed

final dashboardViewNavigatorProvider = Provider<DashboardViewNavigator>((ref) {
  return DashboardViewNavigator();
});

class DashboardViewNavigator with LoginViewRoute {}

mixin DashboardViewRoute {
  openDashboardView() {
    NavigateRoute.popAndPushRoute(const DashboardView());
  }
}