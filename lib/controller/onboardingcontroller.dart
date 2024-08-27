import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GradientController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController gradientController;
  late Animation<Color?> gradientAnimation;

  @override
  void onInit() {
    gradientController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    gradientAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.green,
    ).animate(gradientController);

    super.onInit();
  }

  @override
  void onClose() {
    gradientController.dispose();
    super.onClose();
  }
}

class OnboardingController extends GetxController {
  var currentIndex = 0.obs;

  bool isLastSlide(int totalSlides) {
    return currentIndex.value == totalSlides - 1;
  }

  void updateButtonVisibility(int index) {
    currentIndex.value = index;
  }
}

class AirtimeController extends GetxController {
  var currentIndex = 0.obs;

  bool isLastSlide(int totalSlides) {
    return currentIndex.value == totalSlides - 1;
  }

  void updateButtonVisibility(int index) {
    currentIndex.value = index;
  }
}
