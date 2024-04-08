import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/services/SignupService/otp_service.dart';

class TimerController extends GetxController {
  RxInt minutes = 0.obs;
  RxInt seconds = 0.obs;
  RxBool timerActive = false.obs;
  final signupOtp = SignUpOTP();
  Timer? _timer;
  @override
  void onInit() {
    super.onInit();
    startTimer();
    signupOtp.otpsignup();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Get.defaultDialog(
        title: "Notification",
        content: const Text(
          "Kindly check your mail for OTP",
          style: TextStyle(color: Colors.black),
        ),
        cancel: Icon(Icons.cancel),
        onCancel: Get.back,
      );
    });

// Start the timer when the controller is initialized
  }

  void startTimer() {
    if (!timerActive.value) {
      minutes.value = 2;
      seconds.value = 10;
      timerActive.value = true;

      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (seconds.value > 0) {
          seconds.value--;
        } else if (minutes.value > 0) {
          minutes.value--;
          seconds.value = 59;
        } else {
          timerActive.value = false;
          timer.cancel();
        }
      });
    }
  }

  void resetTimer() {
    _timer?.cancel();
    timerActive.value = false;
    minutes.value = 0;
    seconds.value = 10;
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
