import 'package:flutter/widgets.dart';
import 'package:kwasu_app/presentation/features/dashboard/presentation/view/dashboard_view.dart';
import 'package:kwasu_app/presentation/features/login/presentation/view/login_view.dart';
import 'package:kwasu_app/presentation/general_widgets/splash_screen.dart';

class AppRouter {
  static final Map<String, Widget Function(BuildContext)> _routes = {
    SplashScreen.routeName: (context) => const SplashScreen(),
    LoginView.routeName: (context) => const LoginView(),
    DashboardView.routeName: (context) => const DashboardView(),
  };

  static Map<String, Widget Function(BuildContext)> get routes => _routes;
}
