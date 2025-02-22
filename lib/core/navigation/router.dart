import 'package:flutter/widgets.dart';
import 'package:kwasu_app/presentation/features/login/presentation/view/login_view.dart';
import 'package:kwasu_app/presentation/general_widgets/splash_screen.dart';

class AppRouter {
  static final Map<String, Widget Function(BuildContext)> _routes = {
    SplashScreen.routeName: (context) => const SplashScreen(),
    LoginView.routeName: (context) => const LoginView(),
  };

  static Map<String, Widget Function(BuildContext)> get routes => _routes;
}
