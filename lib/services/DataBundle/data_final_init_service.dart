import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:shapmanpaypoint/Model/AirtimeTopModel/airtime_Topup.dart';
import 'package:shapmanpaypoint/controller/AirtimeTopUp/airtimeController.dart';
import 'package:shapmanpaypoint/controller/DataBundle/data_bundle.dart';
import 'package:shapmanpaypoint/controller/Purchase_successful/purchase_controller.dart';
import 'package:shapmanpaypoint/controller/contact_picker/contact_picker.dart';
import 'package:shapmanpaypoint/controller/otp/otp_controller.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';

import '../../utils/flutter_storage/flutter_storage.dart';

class DataTopUpService {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final Dio dio = Dio(options);
  final airtimeCController = Get.find<AirtimeCController>();
  final OTPController otpController = Get.find<OTPController>();
  final _dataBundleController = Get.find<DataBundleController>();
  final _contactPickerController = Get.find<ContactPickerController>();
  final SecureStorage stora = SecureStorage();
  final PurchaseResponse purchasecontroller = Get.put(PurchaseResponse());
  Future<Response<dynamic>> databundleReq() async {
    final decodedToken = await stora.readSecureData('ResBody');
    Map<String, dynamic> userDecode = json.decode(decodedToken);
    final userId = userDecode['id'];
    purchasecontroller.isLoading.value = true;
    try {
      print(purchasecontroller.isLoading.value);
      final dataReq = {
        "otp": otpController.pinController.value,
        "userId": userId,
        "operatorId": _dataBundleController.selectedPName.value,
        "amount": _dataBundleController.priceController.text,
        "recipientPhone": {
          "countryCode": _dataBundleController.selectedCountryIso.value,
          "number": _contactPickerController.phonController.phoneController.text
        }
      };

      final response =
          await dio.post('/airtime', options: Options(), data: dataReq);
      print("HIIH ${response}");
      otpController.pinController.close();
      const value = '';
      otpController.checkOTP(value);
      if (response.data['transactionId'] != null) {
        purchasecontroller.isLoading.value = false;
        print('HELLOWORLD');
        purchasecontroller.rsuccess.value =
            response.data['transactionId'].toString();
        purchasecontroller.dataRx.value = true;
      } else {
        purchasecontroller.dataRx.value = false;
        otpController.pinController.close();
      }
      return response;
    } catch (error) {
      print('RUFUS');
      purchasecontroller.isLoading.value = true;
      purchasecontroller.dataRx.value = false;
      otpController.pinController.close();

      rethrow;
    } finally {
      purchasecontroller.isLoading.value = false;
      otpController.pinController.close();
    }
  }
}
