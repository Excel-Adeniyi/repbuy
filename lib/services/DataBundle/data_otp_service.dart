import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:get/instance_manager.dart';

import 'package:shapmanpaypoint/controller/DataBundle/data_bundle.dart';
import 'package:shapmanpaypoint/controller/Loader/loader_controller.dart';
import 'package:shapmanpaypoint/controller/contact_picker/contact_picker.dart';
import 'package:shapmanpaypoint/controller/otp/otp_controller.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';
import 'package:shapmanpaypoint/utils/flutter_storage/flutter_storage.dart';

class DataPurchaseService {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final Dio dio = Dio(options);
  final _contactPickerController = Get.find<ContactPickerController>();
  final _dataBundleController = Get.find<DataBundleController>();
  final otpController = Get.put(OTPController());
  final SecureStorage stora = SecureStorage();
  final LoaderController _loaderController = Get.find<LoaderController>();

  Future<Response<dynamic>> datapurchaseReq() async {
    try {
      final decodedToken = await stora.readSecureData('ResBody');
      Map<String, dynamic> userDecode = json.decode(decodedToken);
     
      final dataReq = {
        // "otp": otpController.pinController.value,
        "userId": userDecode['id'],
        "operatorId": _dataBundleController.selectedPName.value,
        "amount":
            "${_dataBundleController.currencySelector.value} ${_dataBundleController.priceController.text}",
        'purchase_type': 'data',
        "order": _dataBundleController.selectedFixedValues.value,
        "provider": _dataBundleController.selectedPName.value,
        "recipientPhone": {
          "countryCode": _dataBundleController.selectedCountryIso.value,
          "number": _contactPickerController.phonController.phoneController.text
        }
      };
      print(dataReq);
      _loaderController.isLoading.value = true;
      final response =
          await dio.post('/history', options: Options(), data: dataReq);
           print("HISTORY MADE");
      if (response.data.containsKey("success") &&
          response.data["success"] == true) {
        _loaderController.isLoading.value = false;
      } else {
        _loaderController.isLoading.value = true;
      }

      return response.data;
    } catch (error) {
      _loaderController.isLoading.value = false;
      rethrow;
    } finally {
      _loaderController.isLoading.value = false;
    }
  }
}
