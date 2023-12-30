// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tttt/component/colors.dart';
import 'package:tttt/widgets/text.dart';

class MyButton extends StatelessWidget {
  double height;
  double width;
  Color color;
  String text;
  MyButton({
    super.key,
    required this.height,
    required this.width,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: color),
        alignment: Alignment.center,
        height: height,
        width: width,
        child: TextWidget(text: text, size: width * 0.12, color: yellow),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, "Cancel"),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, "OK"),
                child: const Text("OK"),
              ),
            ],
            content: SizedBox(
              width: width * 0.5,
              child: Text(
                "Xaridingizdan minnatdormiz. Buyutrmangiz tayyor bo'lgach xabar beramiz :)",
                style: TextStyle(color: black, fontSize: width * 0.1),
              ),
            ),
          ),
        );
      },
    );
  }
}
