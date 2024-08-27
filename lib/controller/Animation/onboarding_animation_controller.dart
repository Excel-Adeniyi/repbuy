import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardAnimation extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    animation = Tween<double>(begin: 0.0, end: 1.0).animate(animationController)
      ..addListener(() {
        update(); // Call update to trigger the update on GetX listeners
      });

    animationController.repeat(reverse: true); // Start the animation
  }

  @override
  void onClose() {
    animationController.dispose(); // Clean up the controller
    super.onClose();
  }
}
