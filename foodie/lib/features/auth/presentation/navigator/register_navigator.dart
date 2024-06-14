import 'package:finalproject/app/navigator/navigator.dart';
import 'package:finalproject/features/home/presentation/view/dashboard_view.dart';

class RegisterViewNavigator {}

mixin RegisterViewRoute {
  openRegisterView() {
    NavigateRoute.pushRoute(const DashboardView());
  }
}