import 'package:get/get.dart';
import 'package:shapmanpaypoint/Model/AirtimeTopModel/airtime_Topup.dart';

class AirtimeCController extends GetxController {
  RxString operatorId = ''.obs;
  RxString amount = ''.obs;
  RxString countryCode = ''.obs;
  RxString number = ''.obs;
  RxString network = ''.obs;

  AirtimeModel toModel() {
    update();
    return AirtimeModel(
      operatorId: operatorId.value,
      amount: amount.value,
      network: network.value,
      countryCode: countryCode.value,
      number: number.value,
    );
  }
  // Return null or handle the case when any value is empty.
  // return null;
}
