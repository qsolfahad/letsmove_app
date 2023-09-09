import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:letsmove_app/routes/routes_name.dart';
import 'package:letsmove_app/views/blocs/login/bloc/login_bloc.dart';
import 'package:letsmove_app/views/screens/transparent.dart';
import 'package:page_transition/page_transition.dart';

import '../blocs/intro/bloc/intro_bloc.dart';

class IntroPage extends StatefulWidget {
  IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.pushNamedAndRemoveUntil(context, login, (route) => false);
  }

  @override
  void initState() {
    BlocProvider.of<IntroBloc>(context).add(LoadIntroData());
    getStringValuesSF();
    Future.delayed(const Duration(milliseconds: 10), () {
      if (sfEmail != 'null' && sfEmail != null) {
        Navigator.pushNamedAndRemoveUntil(context, home, (route) => false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(
        fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold);

    return Scaffold(
      body: BlocBuilder<IntroBloc, IntroState>(builder: (context, state) {
        if (state is IntroStateLoading) {
          return const Center(
              child: CircularProgressIndicator()); // Loading indicator
        } else if (state is IntroLoaded) {
          final data = state.data;
          return IntroductionScreen(
            globalBackgroundColor: Colors.black,
            key: introKey,
            allowImplicitScrolling: true,
            autoScrollDuration: 3000,
            //  infiniteAutoScroll: true,

            //  globalFooter: SizedBox(),
            pages: List<PageViewModel>.generate(
              data.length,
              (index) {
                final document = data[index];
                return PageViewModel(
                    title: document.title,
                    decoration: PageDecoration(
                        boxDecoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/image/intro1.jpeg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        titleTextStyle: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                        bodyTextStyle: bodyStyle,
                        bodyPadding: EdgeInsets.zero,
                        // bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                        imagePadding: EdgeInsets.all(0),
                        footerPadding: EdgeInsets.zero),
                    body: document.body,
                    image: SizedBox(
                      height: 300,
                      child: Container(
                        margin: EdgeInsets.only(top: 60),
                        child: Text(
                          'Virtuagym',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ));
              },
            ),
            onDone: () => _onIntroEnd(context),
            onSkip: () =>
                _onIntroEnd(context), // You can override onSkip callback
            showSkipButton: true,
            skipOrBackFlex: 0,
            nextFlex: 0,
            showBackButton: false,
            globalFooter: SizedBox(
              height: MediaQuery.of(context).size.height / 4,
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
                          child: TransparentBackgroundPage(),
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
                  Text(
                    'Log in',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            //rtl: true, // Display as right-to-left
            back: const SizedBox(),
            skip: const SizedBox(),
            next: const SizedBox(),
            done: const SizedBox(),

            curve: Curves.fastLinearToSlowEaseIn,
            //controlsMargin: const EdgeInsets.all(16),
            // controlsPadding: kIsWeb
            //     ? const EdgeInsets.all(12.0)
            //     : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
            dotsDecorator: const DotsDecorator(
              size: Size(10.0, 10.0),
              activeColor: Colors.white,
              color: Colors.white,
              activeSize: Size(22.0, 10.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
          );
        } else {
          return SizedBox();
        }
      }),
    );
  }
}
