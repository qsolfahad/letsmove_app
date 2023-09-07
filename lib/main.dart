import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsmove_app/routes/routes_name.dart';
import 'package:letsmove_app/routes/routes_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Membership Management',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyMedium: GoogleFonts.montserrat(),
        ),
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: RoutePage.allRoutes,
      initialRoute: intro,
    );
  }
}
