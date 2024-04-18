import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:shapmanpaypoint/controller/otp/otp_controller.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';
import 'package:shapmanpaypoint/utils/flutter_storage/flutter_storage.dart';

class VerifyAirtime {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final dio = Dio(options);
  final SecureStorage stora = SecureStorage();
  final OTPController otpController = Get.find<OTPController>();
  Future<Response<dynamic>> verifyOTP() async {
    final decodedToken = await stora.readSecureData('ResBody');
    Map<String, dynamic> userDecode = json.decode(decodedToken);
    final userId = userDecode['id'];
    try {
      final payload = {
        "otp": otpController.pinController.value,
        "userId": userId,
      };

      final response = await dio.post('/otp/verify', data: payload);
      return response;
    } on DioException catch (error) {
      rethrow;
    }
  }
}
