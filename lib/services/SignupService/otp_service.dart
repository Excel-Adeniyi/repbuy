import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:shapmanpaypoint/controller/Auth/signup_controller.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';

class SignUpOTP {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final Dio dio = Dio(options);
  final SignUpController editcontroller = Get.put(SignUpController());
  Future<Response<dynamic>> otpsignup() async {
    final payload = {"email": editcontroller.email.text};
    try {
      final response =
          await dio.post("/otp", options: Options(), data: payload);
      final responseData = response.data;
      if (responseData['success'] == "true") {
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
      } else {
        Get.snackbar(
          "Error", response.data['message'].toString(),
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
        editcontroller.isLoading.value = false;
      }

      return response;
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  Future<Response<dynamic>> verifyOTP() async {
    try {
      final payload = {
        "email": editcontroller.email.text,
        "otp": editcontroller.pincontroller.text
      };
      editcontroller.isLoading.value = true;
      final response =
          await dio.post("/otp/verify", options: Options(), data: payload);
      final responseData = response.data;
      print(responseData);
      if (responseData['Success'] == true) {
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
        Get.toNamed('/insertpin');
      } else {
        print("Nan");
        editcontroller.pincontroller.clear();
      }
      return response;
    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode == 500) {
        // print(e.message);
        Get.snackbar(
          "Error", e.response!.data['message'].toString(),
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
        editcontroller.pincontroller.clear();
        editcontroller.isLoading.value = false;
      }
      rethrow;
    } catch (error) {
      Get.snackbar(
        "Error", "Internal Server Error, kindly contact support",
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20.0),
        borderRadius: 10.0,
        // dismissDirection: SnackDismissDirection.HORIZONTAL,
        forwardAnimationCurve: Curves.easeOutBack,
        reverseAnimationCurve: Curves.easeInBack,
      );
      editcontroller.pincontroller.clear();
      editcontroller.isLoading.value = false;
      rethrow;
    } finally {
      editcontroller.isLoading.value = false;
    }
  }
}
