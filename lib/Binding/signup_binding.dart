import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/Auth/signup_controller.dart';

class SignupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}
