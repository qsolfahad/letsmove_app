
  import 'package:flutter/material.dart';

import '../../blocs/intro/bloc/intro_bloc.dart';

List<Widget> buildPageIndicator(len, IntroState state) {
    List<Widget> indicators = [];
    for (int i = 0; i < len.length; i++) {
      indicators.add(i == state.counter ? _indicator(true) : _indicator(false));
    }
    return indicators;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }