// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tttt/component/colors.dart';
import 'package:tttt/widgets/container.dart';

class CardWidget extends StatelessWidget {
  String image;
  double height;
  double width;
  CardWidget({
    super.key,
    required this.image,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 3.0,
      surfaceTintColor: black,
      child: ContainerWidget(
        image,
        height: height,
        width: width,
      ),
    );
  }
}
