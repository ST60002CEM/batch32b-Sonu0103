import 'package:finalproject/app/navigator/navigator.dart';
import 'package:finalproject/features/auth/presentation/navigator/login_navigator.dart';
import 'package:finalproject/features/auth/presentation/view/register_view.dart';
import 'package:finalproject/features/home/presentation/view/dashboard_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerViewNavigatorProvider = Provider((ref) => RegisterViewNavigator());
class RegisterViewNavigator with LoginViewRoute{}

mixin RegisterViewRoute {
  openRegisterView() {
    NavigateRoute.pushRoute(const RegisterView());
  }
}