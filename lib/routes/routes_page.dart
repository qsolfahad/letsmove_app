import 'package:flutter/material.dart';
import 'package:letsmove_app/routes/routes_name.dart';
import 'package:letsmove_app/views/screens/intro_page.dart';
import 'package:letsmove_app/views/screens/login_page.dart';
import 'package:letsmove_app/views/screens/not_found.dart';
import 'package:letsmove_app/views/screens/signup_page.dart';

class RoutePage {
  static Route<dynamic> allRoutes(RouteSettings setting) {
    switch (setting.name) {
      case intro:
        return MaterialPageRoute(builder: (x) => IntroPage());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => SignupScreen());
    }
    return MaterialPageRoute(builder: (_) => const NotFoundPage());
  }
}
