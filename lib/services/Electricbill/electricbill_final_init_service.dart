import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:shapmanpaypoint/Model/AirtimeTopModel/airtime_Topup.dart';
import 'package:shapmanpaypoint/controller/AirtimeTopUp/airtimeController.dart';
import 'package:shapmanpaypoint/controller/DataBundle/data_bundle.dart';
import 'package:shapmanpaypoint/controller/Purchase_successful/purchase_controller.dart';
import 'package:shapmanpaypoint/controller/contact_picker/contact_picker.dart';
import 'package:shapmanpaypoint/controller/otp/otp_controller.dart';
import 'package:shapmanpaypoint/controller/utility_controller/utility_controller.dart';
import 'package:shapmanpaypoint/services/DataBundle/data_otp_service.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';

import '../../utils/flutter_storage/flutter_storage.dart';

class UtilityService {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final Dio dio = Dio(options);

  final OTPController otpController = Get.find<OTPController>();

  final SecureStorage stora = SecureStorage();
  final dataPurchaseService = DataPurchaseService();
  final PurchaseResponse purchasecontroller = Get.put(PurchaseResponse());
  final UtilityController utilityController = Get.find<UtilityController>();
  Future<Response<dynamic>> utilityReq() async {
    final decodedToken = await stora.readSecureData('ResBody');
    Map<String, dynamic> userDecode = json.decode(decodedToken);
    final userId = userDecode['id'];

    purchasecontroller.isLoading.value = true;
    try {
      print(purchasecontroller.isLoading.value);
      final reference = DateTime.now().toString();
      // final refJson = json
      print("EFIS");
      final dataReq = {
        // "otp": otpController.pinController.value,
        "userId": userId,
        "subscriberAccountNumber": utilityController.billerMeter.value,
        "amount": utilityController.purchasePrice.value,
        "amountId": null,
        "billerId": utilityController.utilityId.value,
        "useLocalAmount": false,
        "referenceId": reference,
        "additionalInfo": {"invoiceId": null}
      };

      final response =
          await dio.post('/utility/payment', options: Options(), data: dataReq);
      print("HIIH ${response}");
      otpController.pinController.value = '';
      const value = '';
      otpController.checkOTP(value);
      if (response.data['Success'] == true) {
        purchasecontroller.isLoading.value = false;
        print('HELLOWORLD');
        purchasecontroller.rsuccess.value =
            response.data['transactionId'].toString();
        purchasecontroller.dataRx.value = true;
        purchasecontroller.allowDisplay.value = true;
      } else {
        purchasecontroller.dataRx.value = false;
        otpController.pinController.value = '';
      }
      return response;
    } catch (error) {
      print('RUFUS');
      purchasecontroller.isLoading.value = false;
      purchasecontroller.dataRx.value = false;
      otpController.pinController.value = '';

      rethrow;
    } finally {
      purchasecontroller.isLoading.value = false;
      otpController.pinController.value = '';
    }
  }
}
