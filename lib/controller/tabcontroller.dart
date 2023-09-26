import 'package:get/get.dart';

class TabbController extends GetxController {
  var selectedTab = 0.obs;
  final focus1 = false.obs;
  final focus2 = false.obs;
  final focus3 = false.obs;
  final focus4 = false.obs;

  void changeTab(int index) {
    selectedTab.value = index;
  }

  void toggleFocus(int index) {
    focus1.value = false;
    focus2.value = false;
    focus3.value = false;
    focus4.value = false;
    switch (index) {
      case 0:
        focus1.value = !focus1.value;
        break;
      case 1:
        focus2.value = !focus2.value;
        break;
      case 2:
        focus3.value = !focus3.value;
        break;
      case 3:
        focus4.value = !focus4.value;
        break;
    }
  }
}
