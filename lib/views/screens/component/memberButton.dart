import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../subscription.dart';

Widget memberButton(context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.bottomToTop,
          alignment: Alignment.topCenter,
          child: const SubscriptionPage(),
        ),
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      elevation: 3, // Elevation of the button
      padding: const EdgeInsets.symmetric(
          horizontal: 20, vertical: 10), // Button padding
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Button border radius
      ),
    ),
    child: const Text(
      'Click Me to become a Member',
      style: TextStyle(fontSize: 20, color: Colors.white),
    ),
  );
}
