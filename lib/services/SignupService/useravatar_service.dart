import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:shapmanpaypoint/controller/Auth/signup_controller.dart';
import 'package:shapmanpaypoint/controller/Auth/useravatar_controller.dart';
import 'package:shapmanpaypoint/controller/UserInfo/user_info.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';
import 'package:shapmanpaypoint/utils/flutter_storage/flutter_storage.dart';

class UploadAvatarService {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final Dio dio = Dio(options);
  final UserAvatarController avatar = Get.find<UserAvatarController>();
  final SignUpController editcontroller = Get.find<SignUpController>();
  final _userController = Get.find<UserInfoController>();

  final SecureStorage stora = SecureStorage();
  Future<Response<dynamic>> userAvatar() async {
    try {
      final payload = {
        "userAvater": avatar.avatar.value,
        "email": editcontroller.email.text.isNotEmpty
            ? editcontroller.email.text
            : _userController.email.value,
        "password": editcontroller.confirmpassword.text.isNotEmpty
            ? editcontroller.confirmpassword.text
            : _userController.password.value
      };
      print(payload);
      final response =
          await dio.post("/avater", options: Options(), data: payload);
      if (response.data['success'] == true) {
        Get.snackbar(
          "Success", response.data['message'].toString(),
          backgroundColor: Colors.purple,
          snackPosition: SnackPosition.BOTTOM,
          showProgressIndicator: true,
          duration: const Duration(seconds: 3),
          colorText: Colors.white,
          margin: const EdgeInsets.all(20.0),
          borderRadius: 10.0,
          // dismissDirection: SnackDismissDirection.HORIZONTAL,
          forwardAnimationCurve: Curves.easeOutBack,
          reverseAnimationCurve: Curves.easeInBack,
        );
        const sETN = "ksjdkjierowninficd-239nwdc8jsaks&dn9wne!askjd";
        final myPayload = response.data['data'];
        final stringPayload = jsonEncode(myPayload);

        final stringDecode = json.decode(stringPayload);
        final jwt = JWT.verify(stringDecode, SecretKey(sETN));
        print(jwt.payload["first_name"]);
        print(jwt.payload["last_name"]);
        _userController.first_name.value = jwt.payload["first_name"];
        _userController.last_name.value = jwt.payload["last_name"];
        if (jwt.payload != null) {
          print("HIU");
          final jwtPayload = jsonEncode(jwt.payload);
          await stora.writeSecureData('ResBody', jwtPayload);
          Get.toNamed('/dashboard');
        }
      }

      return response;
    } on DioException catch (error) {
      if (error.response != null && error.response!.statusCode == 424) {
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
      } else {
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
      }
      rethrow;
    }
  }
}
