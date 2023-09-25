import 'package:flutter/material.dart';
import 'package:letsmove_app/routes/routes_name.dart';
import 'package:letsmove_app/views/screens/intro_page.dart';
import 'package:letsmove_app/views/screens/not_found.dart';
import 'package:letsmove_app/views/screens/option_page.dart';

import '../views/screens/dashboard.dart';
import '../views/screens/memberships.dart';
import '../views/screens/pending_page.dart';
import '../views/screens/requestPage.dart';

class RoutePage {
  static Route<dynamic> allRoutes(RouteSettings setting) {
    switch (setting.name) {
      case intro:
        return MaterialPageRoute(builder: (x) => const IntroPage());
      case home:
        return MaterialPageRoute(builder: (_) => const DashBoard());
      case option:
        return MaterialPageRoute(builder: (_) => const OptionPage());
      case request:
        return MaterialPageRoute(builder: (_) => const RequestPage());
      case pending:
        return MaterialPageRoute(builder: (_) => const PendingPage());
      case memberList:
        return MaterialPageRoute(builder: (_) => const Memberships());
    }
    return MaterialPageRoute(builder: (_) => const NotFoundPage());
  }
}
