import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:letsmove_app/model/data/constant.dart';
import 'package:letsmove_app/model/data/onboarding.dart';
import 'package:letsmove_app/views/blocs/Auth/bloc/auth_bloc.dart';
import 'package:letsmove_app/views/screens/Authentication.dart';
import 'package:letsmove_app/views/screens/onboarding_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/routes_name.dart';
import '../blocs/intro/bloc/intro_bloc.dart';

class IntroPage extends StatefulWidget {
  IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 0), () async {
      BlocProvider.of<IntroBloc>(context).add(LoadIntroData());
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? login = prefs.getString('id');

      print('my' + login.toString());
      if (login != 'null' && login != null) {
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
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (_currentPage < 2) {
        // Scroll to the next page if not at the last page
        _pageController.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
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
      if (state is IntroStateLoading) {
        return const Center(
            child: CircularProgressIndicator()); // Loading indicator
      } else if (state is IntroLoaded) {
        final data = state.data;
        return Scaffold(
          body: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                itemCount: data.length,
                onPageChanged: (index) {
                 setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final document = data[index];
                  return OnboardingPage(
                    data: OnboardingData(
                      title: document.title,
                      description: document.body,
                      image: document.image,
                    ),
                  );
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
                    children: _buildPageIndicator(data),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: SizedBox(
                        // height: MediaQuery.of(context).size.height / 4,
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
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16),
                              ),
                            ),
                            Text(
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
                              child: Text(
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
      } else {
        return SizedBox();
      }
    });
  }

  List<Widget> _buildPageIndicator(len) {
    List<Widget> indicators = [];
    for (int i = 0; i < len.length; i++) {
      indicators.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return indicators;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
