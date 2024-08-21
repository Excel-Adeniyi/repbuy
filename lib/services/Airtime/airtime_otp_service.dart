import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:shapmanpaypoint/controller/otp/otp_controller.dart';
import 'package:shapmanpaypoint/services/Airtime/airtime_topup_service.dart';
import 'package:shapmanpaypoint/services/DataBundle/data_final_init_service.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';
import 'package:shapmanpaypoint/utils/flutter_storage/flutter_storage.dart';
import 'package:shapmanpaypoint/widgets/amountPrompt/completed_payment.dart';

class VerifyPurchase {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final dio = Dio(options);
  final SecureStorage stora = SecureStorage();
  final OTPController otpController = Get.find<OTPController>();
  final airtimeService = AirtimeTopupService();
  final dataService = DataTopUpService();
  Future<Response<dynamic>> verifyOTP(title) async {
    final decodedToken = await stora.readSecureData('ResBody');
    Map<String, dynamic> userDecode = json.decode(decodedToken);
    final userId = userDecode['id'];
    // print('checking title' + ' ' + title);
    try {
      final payload = {
        "user_pin": otpController.pinController.value,
        "user_id": userId,
      };
      // print(payload);
      final response = await dio.post('/userpin/verify', data: payload);
      if (response.data['Success'] == true) {
        Get.to(CompletedAmount(title: title));

        title == "Data Top Up"
            ? dataService.databundleReq()
            : airtimeService.airtimeReq();
      }
      // print(response);
      return response;
      // ignore: unused_catch_clause
    } on DioException catch (error) {
      rethrow;
    }
  }
}
