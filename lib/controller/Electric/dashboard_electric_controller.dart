import 'package:get/get.dart';
import 'package:shapmanpaypoint/services/Electricbill/electricbill_auth_service.dart';

class DashElectricController extends GetxController {
  final electricAuth = ElectricAuthService();
  @override
  void onInit() {
    electricAuth.electricAuth();
    super.onInit();
  }
}
