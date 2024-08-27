import 'package:get/get.dart';
import 'package:shapmanpaypoint/services/token.dart';

class CSRFINIT extends GetxController {
  final csrfService = CsrfService();

  @override
  void onInit() {
    super.onInit();
    csrfService.get();
  }
}
