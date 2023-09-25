import 'package:flutter/material.dart';
import 'package:letsmove_app/model/data/constant.dart';
import 'package:letsmove_app/routes/routes_name.dart';
import 'package:letsmove_app/views/screens/component/cardsList.dart';
import 'package:letsmove_app/views/screens/difficultyLevel.dart';
import 'package:letsmove_app/views/screens/paySubscription.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay/pay.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../blocs/Auth/bloc/auth_bloc.dart';

class OptionPage extends StatefulWidget {
  const OptionPage({super.key});

  @override
  State<OptionPage> createState() => _OptionPageState();
}

class _OptionPageState extends State<OptionPage> {
  final PageController _pageController = PageController();
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 0), () async {
      BlocProvider.of<AuthBloc>(context).add(LoadUserDetail());
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? isPending = prefs.getBool('isPending');
      bool? isMember = prefs.getBool('isMember');
      if (isPending == true && isPending != null) {
        Navigator.pushNamedAndRemoveUntil(context, pending, (route) => false);
      } else {
        if (isMember == true && isPending != null) {
          Navigator.pushNamedAndRemoveUntil(context, home, (route) => false);
        }
      }
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return SafeArea(
            child: Scaffold(
          body: PageView.builder(
            controller: _pageController,
            itemCount: introClass.length,
            onPageChanged: (index) {},
            itemBuilder: (context, index) {
              return Scaffold(
                body: Container(
                  padding: EdgeInsets.all(16),
                  child: pages[index],
                ),
              );
            },
          ),
        ));
      },
    );
  }
}
