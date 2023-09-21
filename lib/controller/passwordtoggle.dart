import 'package:get/get.dart';

class PasswordController extends GetxController {
  RxBool isVisible = true.obs;
  RxBool isCVisible = true.obs;
  RxBool checked = false.obs;

  void passwordObscureToggle() {
    isVisible.toggle();
    isVisible.refresh();
  }

  void confirmPasswordObscureToggle() {
    isCVisible.toggle();
    isCVisible.refresh();
  }

  void confirmChecked(bool? newValue) {
    if (newValue != null) {
      checked.value = newValue;
    }
  }
}

class ObscureController extends GetxController {
  RxBool isVisible = true.obs;

  void obscureToggle() {
    isVisible.toggle();
    isVisible.refresh();
  }
}

class BalanceObscure extends GetxController {
  RxBool hideText = false.obs;

  void hideToggle() {
    hideText.toggle();
    hideText.refresh();
  }
}
