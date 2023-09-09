import 'package:flutter/material.dart';
//import 'package:introduction_screen/introduction_screen.dart';
import 'package:letsmove_app/model/data/constant.dart';
import 'package:letsmove_app/routes/routes_name.dart';
import 'package:letsmove_app/views/screens/cards.dart';
import 'package:letsmove_app/views/screens/difficultyLevel.dart';
import 'package:letsmove_app/views/screens/paySubscription.dart';
import 'package:pay/pay.dart';

class OptionPage extends StatefulWidget {
  const OptionPage({super.key});

  @override
  State<OptionPage> createState() => _OptionPageState();
}

const _paymentItems = [
  PaymentItem(
    label: 'Total',
    amount: '99.99',
    status: PaymentItemStatus.final_price,
  )
];

class _OptionPageState extends State<OptionPage> {
  // final List<PageViewModel> pages = [
  //   PageViewModel(
  //       title: "What is your main goal?",
  //       bodyWidget: SingleChildScrollView(
  //           child: SizedBox(
  //         height: 1000,
  //         child: CardList(
  //             items: List.generate(
  //                 6,
  //                 (index) => {
  //                       'data' + index.toString(): 'Item is ' + index.toString()
  //                     })),
  //       ))),

  //   PageViewModel(
  //     title: "What is your fitness level?",
  //     bodyWidget: DifficultyLevelsStepIndicator(),
  //     //   image: Center(child: Icon(Icons.cake)),
  //   ),
  //   PageViewModel(
  //       title: "Get fit. Start free.", bodyWidget: const Subscription()),
  //   // Add more pages as needed
  // ];

  @override
  Widget build(BuildContext context) {
    return SizedBox();
    // return Scaffold(
    //   body: IntroductionScreen(
    //     pages: pages,
    //     onDone: () {
    //       Navigator.pushNamedAndRemoveUntil(context, home, (route) => false);
    //     },
    //     onSkip: () {
    //       Navigator.pushNamedAndRemoveUntil(context, home, (route) => false);
    //     },
    //     showNextButton: true,
    //     showSkipButton: true,
    //     skip: const Text("Skip"),
    //     done: const Text("Done"),
    //     next: const Text("Next"),
    //     // doneButtonPersist: true,
    //     dotsDecorator: const DotsDecorator(
    //       // Add this section for navigation dots
    //       size: Size(10.0, 10.0),
    //       color: Color(0xFFBDBDBD),
    //       activeSize: Size(22.0, 10.0),
    //       activeShape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.all(Radius.circular(25.0)),
    //       ),
    //     ),
    //   ),
    // );
  }
}
