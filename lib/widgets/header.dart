// ignore_for_file: must_be_immutable

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  double width;
  Header({super.key,
  required this.width,
  });

  @override
  Widget build(BuildContext context) {
    List<String> header = [
      "Avtomobil saloniga xush kelibsiz",
      "Welcome to the car showroom",
      "Добро пожаловать в автосалон"
    ];
    return AnimatedTextKit(
      animatedTexts: [
        for(String txt in header)
        TypewriterAnimatedText(txt,
        speed: const Duration(milliseconds: 60),
        textStyle: TextStyle(
              fontSize: width * 0.04,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
              fontStyle: FontStyle.italic,
            ),
        ),
      ],
      repeatForever: true,
    );
  }
}
