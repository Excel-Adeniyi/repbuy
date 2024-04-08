import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  final TextEditingController pinController = TextEditingController();

  RxBool isComplete = false.obs;

  void checkOTP(String value) {
    final pinLength = value.length;
    print(pinLength);
    if (pinLength == 4) {
      pinController.text = value;
      isComplete.value = true; // Set isComplete to true when OTP is complete
      update(); // Trigger UI update
      print(isComplete.value);
    } else {
      isComplete.value =
          false; // Set isComplete to false when OTP is not complete
      update(); // Trigger UI update
    }
  }
}
