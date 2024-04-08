import 'package:get/get.dart';
import 'package:shapmanpaypoint/services/Electricbill/electricbill_auth_service.dart';
import 'package:shapmanpaypoint/services/Electricbill/electricbill_biller_service.dart';

class ElectricBill extends GetxController {
  final RxList utilityProvider = [].obs;
  final electricBiller = ElectricBillersService();
  @override
  void onInit() {
    electricBiller.electricbiller();
    super.onInit();
  }
}
