import 'package:flutter/material.dart';

double calculateButtonWidth(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double widthSize = MediaQuery.sizeOf(context).width;
  double containerWidth;
  if (screenWidth < 600) {
    containerWidth = widthSize * 0.9;
  } else if (screenWidth < 1200) {
    containerWidth = widthSize * 0.4;
  } else {
    containerWidth = widthSize * 0.6;
  }
  return containerWidth;
}
