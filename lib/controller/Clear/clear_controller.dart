import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/DataBundle/data_bundle.dart';
import 'package:shapmanpaypoint/controller/Purchase_successful/purchase_controller.dart';
import 'package:shapmanpaypoint/controller/master_controller/master_controller.dart';
import 'package:shapmanpaypoint/controller/otp/otp_controller.dart';
import 'package:shapmanpaypoint/controller/rechargeController.dart';

final MasterController masterController = Get.find<MasterController>();

class ClearController extends GetxController {
  final _otpController = Get.find<OTPController>();
  final _rechargeController = Get.find<RechargeController>();
  final PurchaseResponse purchaseController = Get.find();

  final dataBundleController =
      masterController.databundleController.value == true
          ? Get.find<DataBundleController>()
          : Get.put(DataBundleController());

  void clearForm() {
    // _otpController.pinController.i;
    _rechargeController.amountCont.clear();
    _rechargeController.phoneController.clear();
    dataBundleController.selectedPName.value = "Select Provider";
    dataBundleController.selectedFixedValues.value = "";
    dataBundleController.currencySelector.value = "";
    dataBundleController.selectedFixedAmountDes.value = "00.0";
    dataBundleController.priceController.clear();
    purchaseController.isLoading.value = false;
    purchaseController.dataRx.value = false;
  }
}
