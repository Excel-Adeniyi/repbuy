import 'dart:async';

import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/AdditionalDetailsController/additional_detail_controller.dart';
import 'package:shapmanpaypoint/controller/currency/currencyController.dart';

class PaymentCountDownTimer extends GetxController {
  final overallTime = 2000.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    beginTimer();
  }

  void beginTimer() {
    Get.put(AdditionalDetailsController());
    const countSequence = Duration(seconds: 1);
    // if (_timer != null) {
    //   _timer!.cancel();
    // }
    _timer = Timer.periodic(countSequence, (timer) {
      if (overallTime.value > 0) {
        overallTime.value--;
      } else {
        Get.delete<AdditionalDetailsController>();
        Get.delete<CurrencyController>();
        Get.delete<PaymentCountDownTimer>();
        Get.toNamed('/dashboard');
        timer.cancel();
      }
    });
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}";
  }

  void endTImer() {
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
