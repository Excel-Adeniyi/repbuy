import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Model/Auth/signinModel.dart';
import 'package:shapmanpaypoint/assets/envied/env.dart';
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
  final SignInController signincontroller = Get.find<SignInController>();
  // final _jwtsonPlugin = Jwtson();
  final _userController = Get.put(UserInfoController());
  Future<List<dynamic>> userLogin(User user) async {
    print('OPETION ${options.baseUrl}');
    try {
      signincontroller.isLoading.value = true;

      final token = await stora.readSecureData('X-csrf');
      // final tokenAll = await stora.readAll();
      print(user);
      final cookie = await stora.readSecureData('sid');
      _userController.password.value = user.password;
      final dataS = {
        'userdata': user.userdata,
        'password': user.password,
        'x_csrf': token
      };
      print(dataS);
      dio.interceptors.add(InterceptorsWrapper(onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) {
        options.headers.addAll({'cookie': cookie});
        return handler.next(options);
      }));
      final response = await dio.post('/login', data: dataS);
      print(response);
      final List<dynamic> resData = [];
      if (response.data[0].containsKey('success') &&
          response.data[0]['success'] == true) {
        signincontroller.isLoggedIn.value = true;
        String myPayload = response.data[0]['message'];
        print(myPayload);

        final stringPayload = jsonEncode(myPayload);
        String jws = Env.jwskey;
        final stringDecode = json.decode(stringPayload);
        final jwt = JWT.verify(stringDecode, SecretKey(jws));
        print(jwt.payload);
        print(jwt.payload["first_name"]);
        print(jwt.payload["last_mame"]);
        _userController.first_name.value = jwt.payload["first_name"];
        _userController.last_name.value = jwt.payload["last_mame"];
        _userController.email.value = jwt.payload["email"];
        _userController.phone.value = jwt.payload["phone_number"];
        _userController.exp.value = jwt.payload["exp"];

        if (jwt.payload != null) {
          if (jwt.payload["verified"] == 0) {
            Get.toNamed("/otplogin");
          } else if (jwt.payload["userpin"] == 0) {
            Get.toNamed('/insertpin');
          } else {
            final jwtPayload = jsonEncode(jwt.payload);
            await stora.writeSecureData('ResBody', jwtPayload);
            Get.offNamed('/dashboard');
          }
        }
        resData.add(response.data[0]['success']);
      } else {
        signincontroller.isLoggedIn.value = false;
        signincontroller.isLoading.value = false;
        Get.snackbar(
          "", "",
          backgroundColor: Colors.red,
          messageText: Text(
            response.data[0]['message'].toString(),
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.white),
          ),
          titleText: const Text(
            'Error',
            style: TextStyle(fontWeight: FontWeight.w800, color: Colors.white),
          ),
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 4),
          colorText: Colors.white,
          margin: const EdgeInsets.all(8.0),
          borderRadius: 10.0,
          // dismissDirection: SnackDismissDirection.HORIZONTAL,
          forwardAnimationCurve: Curves.easeOutBack,
          reverseAnimationCurve: Curves.easeInBack,
        );

        resData.add("No data returned");
      }
      // signincontroller.isLoggedIn.value = false;
      return resData;
    } on DioException catch (error) {
      print(error);
      if (error.response != null && error.response?.statusCode != 200) {
        Get.snackbar(
          "Error", error.response!.data['message'].toString(),
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
          colorText: Colors.white,
          margin: const EdgeInsets.all(20.0),
          borderRadius: 10.0,
          // dismissDirection: SnackDismissDirection.HORIZONTAL,
          forwardAnimationCurve: Curves.easeOutBack,
          reverseAnimationCurve: Curves.easeInBack,
        );
        signincontroller.isLoggedIn.value = false;
        signincontroller.isLoading.value = false;
      }
      signincontroller.isLoggedIn.value = false;
      signincontroller.isLoading.value = false;
      rethrow;
    } finally {
      signincontroller.isLoading.value = false;
    }
  }
}
