import 'package:flutter/material.dart';

class ScreenWidth {
  static double calculateContainerWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double containerWidth;

    if (screenWidth < 600) {
      containerWidth = 300.0;
    } else if (screenWidth < 1200) {
      containerWidth = 400.0;
    } else {
      containerWidth = 500.0;
    }
    return containerWidth;
  }
}
