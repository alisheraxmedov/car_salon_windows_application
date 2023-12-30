// ignore_for_file: must_be_immutable

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedText extends StatelessWidget {
  String text;
  AnimatedText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: height * 0.09,
      child: AnimatedTextKit(
        animatedTexts: [
          RotateAnimatedText(
            textAlign: TextAlign.center,
            text,
            textStyle: TextStyle(
              fontSize: width * 0.025,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
          ),
        ],
        repeatForever: true,
      ),
    );
  }
}
