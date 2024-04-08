import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/DataBundle/data_bundle.dart';
import 'package:shapmanpaypoint/controller/otp/otp_controller.dart';
import 'package:shapmanpaypoint/controller/rechargeController.dart';

class ClearController extends GetxController {
  final _otpController = Get.find<OTPController>();
  final _rechargeController = Get.find<RechargeController>();
  final _databundleController = Get.find<DataBundleController>();

  void clearForm() {
    _otpController.pinController.clear();
    _rechargeController.amountCont.clear();
    _rechargeController.phoneController.clear();
    _databundleController.selectedPName.value = "Select Provider";
    _databundleController.selectedFixedValues.value = "";
    _databundleController.currencySelector.value = "";
    _databundleController.selectedFixedAmountDes.value = "00.0";
    _databundleController.priceController.clear();
  }
}
