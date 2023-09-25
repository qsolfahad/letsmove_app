import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letsmove_app/model/data/constant.dart';
import 'package:letsmove_app/views/screens/Authentication.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/routes_name.dart';
import '../blocs/intro/bloc/intro_bloc.dart';
import 'component/indicator.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
 final PageController _pageController = PageController();
  Timer? _timer;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 0), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? login = prefs.getString('id');

      if (login != 'null' && login != null) {
        // ignore: use_build_context_synchronously
        Navigator.pushNamedAndRemoveUntil(context, home, (route) => false);
      }
    });

    // Start automatic scrolling after a delay
    _startAutoScroll();

    super.initState();
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer?.cancel();
    super.dispose();
  }

  void _startAutoScroll() {
    // Set up a timer to automatically scroll pages
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      int index = BlocProvider.of<IntroBloc>(context).state.counter;
      if (index < introClass.length - 1) {
        // Scroll to the next page if not at the last page
        _pageController.nextPage(
          duration: const Duration(seconds: 3),
          curve: Curves.easeOutSine,
        );
      } else {
        // Stop the timer when at the last page
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(
        fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold);

    return BlocBuilder<IntroBloc, IntroState>(builder: (context, state) {
      return Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: introClass.length,
              onPageChanged: (index) {
                state.counter = index;
                BlocProvider.of<IntroBloc>(context).add(CounterPage());
              },
              itemBuilder: (context, index) {
                return introClass[index];
              },
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.8,
              left: 16,
              right: 16,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: buildPageIndicator(introClass, state),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.bottomToTop,
                                  alignment: Alignment.topCenter,
                                  child: AuthenticationPage(Auth.SIGNUP),
                                ),
                              );
                            },
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16),
                            ),
                          ),
                        const  Text(
                            '|',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.bottomToTop,
                                  alignment: Alignment.topCenter,
                                  child: AuthenticationPage(Auth.LOGIN),
                                ),
                              );
                            },
                            child: const Text(
                              'Log in',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16),
                            ),
                          )
                        ],
                      ))),
            ),
          ],
        ),
      );
    });
  }

}
