import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';

import 'package:shapmanpaypoint/controller/Auth/pincode_controller.dart';
import 'package:shapmanpaypoint/controller/Auth/signup_controller.dart';
import 'package:shapmanpaypoint/controller/UserInfo/user_info.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';

class PincodeService {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final Dio dio = Dio(options);
  final PinCodeController _pinCodeController = Get.find<PinCodeController>();
  final SignUpController editcontroller = Get.put(SignUpController());
  final UserInfoController _userInfo = Get.put(UserInfoController());
  Future<Response<dynamic>> pincodeService() async {
    try {
      editcontroller.isLoading.value = true;
      print(_pinCodeController.pinController.text);
      print(_pinCodeController.confirmpinController.text);
      if (_pinCodeController.pinController.text ==
          _pinCodeController.confirmpinController.text) {
        final payload = {
          "email": editcontroller.email.text.isEmpty
              ? _userInfo.email.value
              : editcontroller.email.text,
          "pincode": _pinCodeController.confirmpinController.text
        };
        print(payload);
        final response =
            await dio.post('/userpin', options: Options(), data: payload);
        print(response);
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
          Get.toNamed('/selectavatar');
        }
        editcontroller.isLoading.value = false;
        return response;
      } else {
        Get.snackbar(
          "Error", "Password doesn't match",
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
        _pinCodeController.confirmpinController.clear();
        _pinCodeController.pinController.clear();
        Get.toNamed("/insertpin");
        const dynamic response = "Nan";

        editcontroller.isLoading.value = false;
        return response;
      }
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

        _pinCodeController.confirmpinController.clear();
        _pinCodeController.pinController.clear();
        Get.toNamed('/insertpin');
        editcontroller.isLoading.value = false;
      }
      rethrow;
    } finally {
      editcontroller.isLoading.value = false;
      _pinCodeController.confirmpinController.clear();
      _pinCodeController.pinController.clear();
    }
  }
}
