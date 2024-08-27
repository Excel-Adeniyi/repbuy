import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:shapmanpaypoint/controller/AirtimeTopUp/airtimeController.dart';
import 'package:shapmanpaypoint/controller/Loader/loader_controller.dart';
import 'package:shapmanpaypoint/controller/otp/otp_controller.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';
import 'package:shapmanpaypoint/utils/flutter_storage/flutter_storage.dart';

class OTPService {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final Dio dio = Dio(options);
  final airtimeCController = Get.find<AirtimeCController>();
  final otpController = Get.put(OTPController());
  final SecureStorage stora = SecureStorage();
  final LoaderController _loaderController = Get.find<LoaderController>();

  Future<Response<dynamic>> otpReq() async {
    try {
      final decodedToken = await stora.readSecureData('ResBody');
      Map<String, dynamic> userDecode = json.decode(decodedToken);
      airtimeCController.update();

      final dataReq = {
        "otp": otpController.pinController.value,
        "userId": userDecode['id'],
        "operatorId": airtimeCController.toModel().operatorId,
        "amount": airtimeCController.toModel().amount,
        "order": "${airtimeCController.network.value} Airtime",
        "provider": airtimeCController.network.value,
        "recipientPhone": {
          "countryCode": airtimeCController.toModel().countryCode,
          "number": airtimeCController.toModel().number
        }
      };
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
