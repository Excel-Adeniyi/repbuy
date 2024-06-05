import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:get/instance_manager.dart';
import 'package:shapmanpaypoint/controller/Purchase_successful/purchase_controller.dart';
import 'package:shapmanpaypoint/controller/otp/otp_controller.dart';
import 'package:shapmanpaypoint/controller/utility_controller/utility_controller.dart';
import 'package:shapmanpaypoint/services/Electricbill/electric_purchase_verify.dart';
import 'package:shapmanpaypoint/services/Electricbill/electricbill_purchase_data_save.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';
import '../../utils/flutter_storage/flutter_storage.dart';

class UtilityService {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final Dio dio = Dio(options);

  final OTPController otpController = Get.put(OTPController());

  final SecureStorage stora = SecureStorage();
  // final dataPurchaseService = DataPurchaseService();
  final PurchaseResponse purchasecontroller = Get.put(PurchaseResponse());
  final UtilityController utilityController = Get.find<UtilityController>();
  final utilityVerifier = UtilityVerify();
  final utilityPurchaseSave = UtilityDataSave();
  Future<Response<dynamic>> utilityReq(transId) async {
    final decodedToken = await stora.readSecureData('ResBody');
    Map<String, dynamic> userDecode = json.decode(decodedToken);
    final userId = userDecode['id'];
    purchasecontroller.isLoading.value = true;
    purchasecontroller.allowDisplay.value = false;
    purchasecontroller.dataRx.value = false;
    try {
      print(purchasecontroller.isLoading.value);
      final reference = DateTime.now().toString();
      final dataReq = {
        // "otp": otpController.pinController.value,
        "userId": userId,
        "subscriberAccountNumber": utilityController.billerMeter.value,
        "amount": utilityController.purchasePrice.value,
        "amountId": null,
        "billerId": utilityController.utilityId.value,
        "useLocalAmount": false,
        "referenceId": transId.toString(),
        "ntransactionId": transId.toString(),
        "additionalInfo": {"invoiceId": transId.toString()}
      };

      final response =
          await dio.post('/utility/payment', options: Options(), data: dataReq);
      print("HIIH ${response}");
      otpController.pinController.value = '';
      const value = '';
      final pid = response.data['message']['id'];
      print('PRINTING PID $pid');
      otpController.checkOTP(value);
      if (response.data['Success'] == true) {
        if (response.data['message']['status'] == "PROCESSING") {
          purchasecontroller.pending.value = true;
          utilityController.processMessage.value =
              response.data['message']['message'];
          // utilityVerifier.utilityVerify(pid);
        } else {
          null;
        }
        purchasecontroller.isLoading.value = false;
        purchasecontroller.rsuccess.value = response.data['message'].toString();
        purchasecontroller.dataRx.value = true;
        purchasecontroller.allowDisplay.value = true;
      } else {
        purchasecontroller.isLoading.value = false;
        purchasecontroller.dataRx.value = false;
        otpController.pinController.value = '';
      }
      return response;
    } on DioException catch (error) {
      if (error.response!.statusCode == 503) {
        purchasecontroller.isLoading.value = false;
        purchasecontroller.dataRx.value = false;
        purchasecontroller.allowDisplay.value = true;
        otpController.pinController.value = '';
      }
      print('RUFUS $error');
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
