import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PinCodeController extends GetxController {
  final pinController = TextEditingController();
  final confirmpinController = TextEditingController();

  void updateControllers(String newValue) {
    if (newValue.isNotEmpty && newValue.length == 4) {
      printInfo();
      confirmpinController.text = newValue;
    }
  }

  void updateRegularControll(String newValue) {
    if (newValue.isNotEmpty && newValue.length == 4) {
      pinController.text = newValue;
    }
  }
}
