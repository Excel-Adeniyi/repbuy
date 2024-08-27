import 'package:flutter/material.dart';

class ScreenWidth {
  static double calculateContainerWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double widthSize = MediaQuery.sizeOf(context).width;
    double containerWidth;
    if (screenWidth < 600) {
      containerWidth = widthSize * 0.9;
    } else if (screenWidth < 1200) {
      containerWidth = widthSize * 0.5;
    } else {
      containerWidth = widthSize * 0.7;
    }
    return containerWidth;
  }
}
