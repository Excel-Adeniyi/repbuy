import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/instance_manager.dart';
import 'package:shapmanpaypoint/Model/AirtimeTopModel/airtime_Topup.dart';
import 'package:shapmanpaypoint/controller/AirtimeTopUp/airtimeController.dart';
import 'package:shapmanpaypoint/utils/flutter_storage/flutter_storage.dart';

class OTPService {
  static BaseOptions options = BaseOptions(
    baseUrl: "http://172.21.67.29:2110",
    connectTimeout: Duration(seconds: 10),
    receiveTimeout: Duration(seconds: 10),
  );
  final Dio dio = Dio(options);
  final airtimeCController = Get.find<AirtimeCController>();
  final SecureStorage stora = SecureStorage();
  Future<Response<dynamic>> otpReq() async {
    print(stora);
    try {
      final decodedToken = await stora.readSecureData('ResBody');
      Map<String, dynamic> userDecode = json.decode(decodedToken);
      final userId = userDecode['id'];
      airtimeCController.update();
      print(airtimeCController.toModel().amount);
      final dataReq = {
        "userId": userDecode['id'],
        "operatorId": airtimeCController.toModel().operatorId,
        "amount": airtimeCController.toModel().amount,
        "recipientPhone": {
          "countryCode": airtimeCController.toModel().countryCode,
          "number": airtimeCController.toModel().number
        }
      };
      final response =
          await dio.post('/history', options: Options(), data: dataReq);
      print(response);
      return response;
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
