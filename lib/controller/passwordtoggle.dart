import 'package:get/get.dart';

class ObscureController extends GetxController {
  RxBool isVisible = true.obs;

  void obscureToggle() {
    isVisible.toggle();
    isVisible.refresh();
  }
}
