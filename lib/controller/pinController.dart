import 'package:get/get.dart';

class PinController extends GetxController {
  RxString pin = ''.obs;

  void setPin(String newPin) {
    pin.value = newPin;
  }

  void addToPin(String digit) {
    if (pin.value.length < 4) {
      pin.value += digit;
    }
  }

  void clearPin() {
    pin.value = '';
  }
}
