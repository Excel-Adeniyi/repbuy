import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:get/instance_manager.dart';

import 'package:shapmanpaypoint/controller/DataBundle/data_bundle.dart';
import 'package:shapmanpaypoint/controller/Loader/loader_controller.dart';
import 'package:shapmanpaypoint/controller/contact_picker/contact_picker.dart';
import 'package:shapmanpaypoint/controller/otp/otp_controller.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';
import 'package:shapmanpaypoint/utils/flutter_storage/flutter_storage.dart';

class DataOTPService {
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

  Future<Response<dynamic>> dataotpReq() async {
    try {
      final decodedToken = await stora.readSecureData('ResBody');
      Map<String, dynamic> userDecode = json.decode(decodedToken);

      final dataReq = {
        "otp": otpController.pinController.text,
        "userId": userDecode['id'],
        "operatorId": _dataBundleController.selectedPName.value,
        "amount":
            "${_dataBundleController.currencySelector.value} ${_dataBundleController.priceController.text}",
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
      if (response.data.containsKey("success") &&
          response.data["success"] == true) {
        _loaderController.isLoading.value = false;
      } else {
        _loaderController.isLoading.value = true;
      }

      return response;
    } catch (error) {
      _loaderController.isLoading.value = true;
      rethrow;
    } finally {
      _loaderController.isLoading.value = false;
    }
  }
}
