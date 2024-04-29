import 'package:get/get.dart';

class PurchaseResponse extends GetxController {
  RxString rsuccess = ''.obs;
  RxBool isLoading = true.obs;
  RxBool dataRx = false.obs;
  RxBool allowDisplay = false.obs;
  RxBool pending = false.obs;
}
