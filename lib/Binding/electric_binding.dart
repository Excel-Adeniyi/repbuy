import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/Electric/dashboard_electric_controller.dart';
import 'package:shapmanpaypoint/controller/Electric/electricbill_controller.dart';
import 'package:shapmanpaypoint/controller/Payment/payment_controller.dart';

class ElectricBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ElectricBill());
  }
}

class DashElectricBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(PaymentController());
    Get.put(DashElectricController());
  }
}
