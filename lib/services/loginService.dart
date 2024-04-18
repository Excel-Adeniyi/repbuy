import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Model/Auth/signinModel.dart';
import 'package:shapmanpaypoint/controller/Auth/signin_controller.dart';
import 'package:shapmanpaypoint/controller/UserInfo/user_info.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';
import 'package:shapmanpaypoint/utils/flutter_storage/flutter_storage.dart';

class SigninService {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final Dio dio = Dio(options);

  final SecureStorage stora = SecureStorage();
  final SignInController login = Get.find<SignInController>();
  // final _jwtsonPlugin = Jwtson();
  final _userController = Get.put(UserInfoController());
  Future<List<dynamic>> userLogin(User user) async {
    try {
      login.isLoading.value = true;

      final token = await stora.readSecureData('X-csrf');
      // final tokenAll = await stora.readAll();
      _userController.password.value = user.password;
      final dataS = {
        'userdata': user.userdata,
        'password': user.password,
        'csrf': token
      };
      // print(dataS);R
      final response =
          await dio.post('/login', options: Options(), data: dataS);
      print(response);
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
        print(jwt.payload);
        print(jwt.payload["first_name"]);
        print(jwt.payload["last_mame"]);
        _userController.first_name.value = jwt.payload["first_name"];
        _userController.last_name.value = jwt.payload["last_mame"];
        _userController.email.value = jwt.payload["email"];

        if (jwt.payload != null) {
          if (jwt.payload["verified"] == 0) {
            Get.toNamed("/otplogin");
          } else if (jwt.payload["userpin"] == null) {
            Get.toNamed('/insertpin');
          } else {
            final jwtPayload = jsonEncode(jwt.payload);
            await stora.writeSecureData('ResBody', jwtPayload);
            Get.toNamed('/dashboard');
          }
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
