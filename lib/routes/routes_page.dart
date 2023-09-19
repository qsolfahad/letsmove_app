import 'package:flutter/material.dart';
import 'package:letsmove_app/routes/routes_name.dart';
import 'package:letsmove_app/views/screens/Member_list.dart';
import 'package:letsmove_app/views/screens/calender_page.dart';
import 'package:letsmove_app/views/screens/home_screen.dart';
import 'package:letsmove_app/views/screens/intro_page.dart';
import 'package:letsmove_app/views/screens/not_found.dart';
import 'package:letsmove_app/views/screens/option_page.dart';

import '../views/screens/pending_page.dart';

class RoutePage {
  static Route<dynamic> allRoutes(RouteSettings setting) {
    switch (setting.name) {
      case intro:
        return MaterialPageRoute(builder: (x) => const IntroPage());
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case option:
        return MaterialPageRoute(builder: (_) => const OptionPage());
      case calender:
        return MaterialPageRoute(builder: (_) => const CalenderPage());
      case pending:
        return MaterialPageRoute(builder: (_) => const PendingPage());
      case memberList:
        return MaterialPageRoute(builder: (_) => const MemberList());
    }
    return MaterialPageRoute(builder: (_) => const NotFoundPage());
  }
}
