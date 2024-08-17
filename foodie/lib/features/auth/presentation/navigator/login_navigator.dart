
import 'package:finalproject/app/navigator/navigator.dart';
import 'package:finalproject/features/auth/presentation/navigator/register_navigator.dart';
import 'package:finalproject/features/auth/presentation/view/login_view.dart';
import 'package:finalproject/features/home/presentation/view/dashboard_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../forgot_password/presentation/navigator/forgot_password_navigator.dart';
import '../../../home/presentation/navigator/dashboard_navigator.dart';

final loginViewNavigatorProvider = Provider((ref) => LoginViewNavigator());

class LoginViewNavigator with RegisterViewRoute,  DashboardViewRoute, ForgotPasswordViewRoute {}

mixin LoginViewRoute {
  openLoginView() {
    NavigateRoute.popAndPushRoute(const DashboardView());
  }
}
