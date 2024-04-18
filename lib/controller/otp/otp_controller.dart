import 'package:get/get.dart';

class OTPController extends GetxController {
  RxString pinController = ''.obs;

  RxBool isComplete = false.obs;

  void checkOTP(String value) {
    final pinLength = value.length;
    // print(pinLength);
    if (pinLength == 4) {
      pinController.value = value;
      isComplete.value = true; // Set isComplete to true when OTP is complete
      // print(pinController.text);
      update(); // Trigger UI update
      // print(isComplete.value);
    } else {
      isComplete.value =
          false; // Set isComplete to false when OTP is not complete
      update(); // Trigger UI update
    }
  }
}
