import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/electric/Completed/utility_status.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/giftcard/widget/completed/giftcard_completed.dart';
import 'package:shapmanpaypoint/controller/otp/otp_controller.dart';
import 'package:shapmanpaypoint/services/Electricbill/electricbill_final_init_service.dart';
import 'package:shapmanpaypoint/services/GiftCard/giftcard_final_init_service.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';
import 'package:shapmanpaypoint/utils/flutter_storage/flutter_storage.dart';


class GiftCardVerifyPurchase {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final dio = Dio(options);
  final SecureStorage stora = SecureStorage();
  final OTPController otpController = Get.find<OTPController>();
  // final airtimeService = AirtimeTopupService();
  // final dataService = DataTopUpService();
  final giftcardService = GiftcardFinalService();
  Future<Response<dynamic>> verifyOTP(title) async {
    final decodedToken = await stora.readSecureData('ResBody');
    Map<String, dynamic> userDecode = json.decode(decodedToken);
    final userId = userDecode['id'];
    print('checking title' + ' ' + title);
    try {
      final payload = {
        "user_pin": otpController.pinController.value,
        "user_id": userId,
      };
      print(payload);
      final response = await dio.post('/userpin/verify', data: payload);
      if (response.data['Success'] == true) {
        Get.to(GiftCardCompletedAmount());

        giftcardService.gcpaymentReq();
      }
      print(response);
      return response;
    } on DioException catch (error) {
      rethrow;
    }
  }
}
