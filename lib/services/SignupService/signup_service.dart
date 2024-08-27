import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:shapmanpaypoint/controller/Auth/signup_controller.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';

class SignUpService {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final Dio dio = Dio(options);

  final SignUpController editcontroller = Get.find<SignUpController>();
  Future<Response<dynamic>> signinAuth() async {
    final dataReq = {
      "first_name": editcontroller.firstname.text,
      "last_name": editcontroller.lastname.text,
      "email": editcontroller.email.text,
      "country": editcontroller.country.value,
      "phone_number": editcontroller.phone.text,
      "password": editcontroller.password.text,
      "terms_n_condition": editcontroller.terms.value == true ? 1 : 0
    };
    print(options.baseUrl);
    print(dataReq);
    try {
      editcontroller.isLoading.value = true;
      final response =
          await dio.post('/create', options: Options(), data: dataReq);
      print(response);
      if (response.statusCode == 200 &&
          response.data["success"] == true) {
        Get.snackbar("Success", response.data["message"].toString(),
            backgroundColor: Colors.purple,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 3),
            margin: const EdgeInsets.all(20.0),
            borderRadius: 10.0,
            // dismissDirection: SnackDismissDirection.HORIZONTAL,
            forwardAnimationCurve: Curves.easeOutBack,
            reverseAnimationCurve: Curves.easeInBack,
            showProgressIndicator: true);
        Get.toNamed('/completeScreen');
        editcontroller.isLoading.value = false;
      } else if (response.statusCode == 409) {
        Get.snackbar(
          "Error", response.data["message"].toString(),
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
          margin: const EdgeInsets.all(20.0),
          borderRadius: 10.0,
          // dismissDirection: SnackDismissDirection.HORIZONTAL,
          forwardAnimationCurve: Curves.easeOutBack,
          reverseAnimationCurve: Curves.easeInBack,
        );
        editcontroller.isLoading.value = false;
      }
      return response;
    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode == 409) {
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
      editcontroller.isLoading.value = false;
      rethrow;
    } finally {
      editcontroller.isLoading.value = false;
    }
  }
}
