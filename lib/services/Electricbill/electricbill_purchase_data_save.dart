import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:shapmanpaypoint/controller/utility_controller/utility_controller.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';
import 'package:shapmanpaypoint/utils/flutter_storage/flutter_storage.dart';

class UtilityDataSave {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final Dio dio = Dio();
  final SecureStorage stora = SecureStorage();
  final UtilityController utilityController = Get.find<UtilityController>();
  Future<Response<dynamic>> sendReq() async {
    final decodedToken = await stora.readSecureData('ResBody');
    Map<String, dynamic> userDecode = json.decode(decodedToken);
    final userId = userDecode['id'];
    final payload = {
      // "otp": otpController.pinController.value,
      "userId": userId,
      "subscriberAccountNumber": utilityController.billerMeter.value,
      "amount": utilityController.purchasePrice.value,
      // "countryCode": utilityController.
      "billerId": utilityController.utilityId.value,
      "purchase_type": "Electric bill"
    };
    try {
      final response = await dio.post('/utility/purchase/data', data: payload);
      return response;
    } on DioException catch (error) {
      rethrow;
    }
  }
}
