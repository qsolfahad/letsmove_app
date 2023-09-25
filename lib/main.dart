import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsmove_app/routes/routes_name.dart';
import 'package:letsmove_app/routes/routes_page.dart';
import 'package:letsmove_app/provider/bloc_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: AppBlocProvider.allBlocProviders,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Membership Management',
          theme: ThemeData(
            textTheme: TextTheme(
              bodyMedium: GoogleFonts.montserrat(),
            ),
            scaffoldBackgroundColor: Colors.white,
            primarySwatch: Colors.grey,
          ),
          onGenerateRoute: RoutePage.allRoutes,
          initialRoute: intro,
        ));
  }
}
