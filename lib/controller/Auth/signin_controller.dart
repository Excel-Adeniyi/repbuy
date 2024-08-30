import 'package:get/get.dart';

class SignInController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxBool isLoggedIn = false.obs;
  RxString userInfo = "".obs;
  RxString password = "".obs;
}
