import 'package:flutter/material.dart';

import '../../../model/data/constant.dart';

class AvatarImage extends StatelessWidget {
  const AvatarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Container(
        decoration: avatarDecoration,
        padding: const EdgeInsets.all(0),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('images/help.png'),
            ),
          ),
        ),
      ),
    );
  }
}