import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';
import 'package:shapmanpaypoint/utils/flutter_storage/flutter_storage.dart';

class FCMTokenSender {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );

  final Dio dio = Dio(options);
  final SecureStorage stora = SecureStorage();
  Future<Response<dynamic>> tokenToBackend(String token) async {
      print(token);
    final decodedResponse = await stora.readSecureData("ResBody");
    print('STAT $decodedResponse');
    Map<String, dynamic> userDecode = json.decode(decodedResponse);
    final userid = userDecode['id'];
    try {
      final payload = {"userid": userid, "fcm_token": token};
      final response = await dio.post('/store/token', data: payload);
      if (response.data['Success'] == true) {
        print("verified");
      }
      return response;
    } on DioException catch (error) {
      print(error);
      rethrow;
    }
  }
}
