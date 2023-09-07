import 'package:flutter/material.dart';
import 'package:letsmove_app/routes/routes_name.dart';
import 'package:letsmove_app/views/intro_page.dart';
import 'package:letsmove_app/views/login_page.dart';
import 'package:letsmove_app/views/not_found.dart';

class RoutePage {
  static Route<dynamic> allRoutes(RouteSettings setting) {
    switch (setting.name) {
      case intro:
        return MaterialPageRoute(builder: (_) => IntroPage());
      case login:
        return MaterialPageRoute(builder: (_) => LoginPage());
    }
    return MaterialPageRoute(builder: (_) => const NotFoundPage());
  }
}
