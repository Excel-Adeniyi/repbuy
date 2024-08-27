import 'package:get/get.dart';

class LoaderController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isVerifying = false.obs;
  RxBool isChecker = false.obs;
  RxBool isVerifyFailed = false.obs;
}
