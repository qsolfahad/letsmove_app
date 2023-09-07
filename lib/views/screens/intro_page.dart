import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:letsmove_app/routes/routes_name.dart';

import '../blocs/intro/bloc/intro_bloc.dart';

class IntroPage extends StatefulWidget {
  IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushNamed(login);
  }

  loaddata() {
    FirebaseFirestore.instance
        .collection('intro')
        .get()
        .then((value) => value.docs.forEach((element) {
              print(element.id);
            }));
  }

  @override
  void initState() {
    loaddata();
    BlocProvider.of<IntroBloc>(context).add(LoadIntroData());
    super.initState();
  }

  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/fullscreen.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return Scaffold(
      body: BlocBuilder<IntroBloc, IntroState>(builder: (context, state) {
        print('hello');
        if (false) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is IntroLoaded) {
          final data = state.data;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final document = data[index];
              // Render your Firestore document data here
              return ListTile(
                title: Text(document.title),
                subtitle: Text(document.body),
              );
            },
          );

          // return IntroductionScreen(
          //   key: introKey,
          //   globalBackgroundColor: Colors.white,
          //   allowImplicitScrolling: true,
          //   autoScrollDuration: 3000,
          //   //  infiniteAutoScroll: true,

          //   globalFooter: SizedBox(
          //     width: double.infinity,
          //     height: 60,
          //     child: ElevatedButton(
          //       child: const Text(
          //         'Let\'s go right away!',
          //         style:
          //             TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          //       ),
          //       onPressed: () => _onIntroEnd(context),
          //     ),
          //   ),
          //   pages: [
          //     PageViewModel(
          //       title: "Personal Trainers",
          //       body:
          //           "Get access to experienced personal trainers who will guide you on your fitness journey.",
          //       image: _buildImage('assets/image/img.png'),
          //       decoration: pageDecoration,
          //     ),
          //     PageViewModel(
          //       title: "Fitness Programs",
          //       body:
          //           "Explore a variety of fitness programs designed to help you achieve your fitness goals.",
          //       image: _buildImage('assets/image/img.png'),
          //       decoration: pageDecoration,
          //     ),
          //     PageViewModel(
          //       title: "Family-Friendly Environment",
          //       body:
          //           "Our gym is family-friendly, so you can work out while your kids enjoy our play area.",
          //       image: _buildImage('assets/image/img.png'),
          //       decoration: pageDecoration,
          //     ),
          //   ],
          //   onDone: () => _onIntroEnd(context),
          //   onSkip: () =>
          //       _onIntroEnd(context), // You can override onSkip callback
          //   showSkipButton: true,
          //   skipOrBackFlex: 0,
          //   nextFlex: 0,
          //   showBackButton: false,
          //   //rtl: true, // Display as right-to-left
          //   back: const Icon(Icons.arrow_back),
          //   skip: const Text('Skip',
          //       style: TextStyle(fontWeight: FontWeight.w600)),
          //   next: const Icon(Icons.arrow_forward),
          //   done: const Text('Done',
          //       style: TextStyle(fontWeight: FontWeight.w600)),

          //   curve: Curves.fastLinearToSlowEaseIn,
          //   controlsMargin: const EdgeInsets.all(16),
          //   controlsPadding: kIsWeb
          //       ? const EdgeInsets.all(12.0)
          //       : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
          //   dotsDecorator: const DotsDecorator(
          //     size: Size(10.0, 10.0),
          //     color: Color(0xFFBDBDBD),
          //     activeSize: Size(22.0, 10.0),
          //     activeShape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.all(Radius.circular(25.0)),
          //     ),
          //   ),
          //   dotsContainerDecorator: const ShapeDecoration(
          //     color: Colors.black87,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.all(Radius.circular(8.0)),
          //     ),
          //   ),
          // );
        }
        return SizedBox();
        ;
      }),
    );
  }
}
