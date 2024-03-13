import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Model/Auth/signinModel.dart';
import 'package:shapmanpaypoint/controller/Auth/signInController.dart';
import 'package:shapmanpaypoint/utils/flutter_storage/flutter_storage.dart';

class SigninService {
  static BaseOptions options = BaseOptions(
    baseUrl: "http://172.21.67.29:2110",
    connectTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 3),
  );
  final Dio dio = Dio(options);

  final SecureStorage stora = SecureStorage();
  final SignInController login = Get.find<SignInController>();
  // final _jwtsonPlugin = Jwtson();
  Future<List<dynamic>> userLogin(User user) async {
    try {
      login.isLoading.value = true;

      final token = await stora.readSecureData('X-csrf');
      // final tokenAll = await stora.readAll();

      final dataS = {
        'userdata': user.userdata,
        'password': user.password,
        'csrf': token
      };
      // print(dataS);R
      final response =
          await dio.post('/login', options: Options(), data: dataS);
      final List<dynamic> resData = [];
      if (response.data[0].containsKey('success') &&
          response.data[0]['success'] == true) {
        login.isLoggedIn.value = true;
        String myPayload = response.data[0]['message'];
        print(myPayload);
        const sETN = "ksjdkjierowninficd-239nwdc8jsaks&dn9wne!askjd";
        final stringPayload = jsonEncode(myPayload);
        final stringDecode = json.decode(stringPayload);
        final jwt = JWT.verify(stringDecode, SecretKey(sETN));
        if (jwt.payload != null) {
          final jwtPayload = jsonEncode(jwt.payload);
          await stora.writeSecureData('ResBody', jwtPayload);
          Get.toNamed('/dashboard');
        }
        resData.add(response.data[0]['success']);
      } else {
        login.isLoggedIn.value = false;
        resData.add("No data returned");
      }

      return resData;
    } catch (error) {
      login.isLoggedIn.value = false;
      rethrow;
    } finally {
      login.isLoading.value = false;
    }
  }
}
