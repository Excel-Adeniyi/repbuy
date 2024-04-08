import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:get/instance_manager.dart';
import 'package:shapmanpaypoint/controller/AirtimeTopUp/airtimeController.dart';
import 'package:shapmanpaypoint/controller/Auth/signup_controller.dart';
import 'package:shapmanpaypoint/controller/UserInfo/user_info.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';
import 'package:shapmanpaypoint/utils/flutter_storage/flutter_storage.dart';

class PaymentService {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final dio = Dio(options);
  final SignUpController editcontroller = Get.find<SignUpController>();
  final AirtimeCController airtimeCController = Get.find<AirtimeCController>();
  final SecureStorage stora = SecureStorage();
  final UserInfoController _userInfo = Get.find<UserInfoController>();
  Future<String> paymentInit() async {
    final decodedToken = await stora.readSecureData('ResBody');
    Map<String, dynamic> userDecode = json.decode(decodedToken);
    try {
      final payload = {
        "email": editcontroller.email.text.isEmpty
            ? _userInfo.email.value
            : editcontroller.email.text,
        "amount": airtimeCController.amount.value,
        "userId": userDecode['id']
      };

      final response =
          await dio.post('/getreference', options: Options(), data: payload);
      if (response.data['success'] == true) {
        String accesscode = response.data['message'];
        return accesscode;
      } else {
        const dynamic response = "undefined";
        return response;
      }
    } catch (error) {
      rethrow;
    }
  }
}
