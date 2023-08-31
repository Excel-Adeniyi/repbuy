import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var currentIndex = 0.obs;

  bool isLastSlide(int totalSlides) {
    return currentIndex.value == totalSlides - 1;
  }

  void updateButtonVisibility(int index) {
    currentIndex.value = index;
  }
}
