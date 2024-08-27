import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/AdditionalDetailsController/additional_detail_controller.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';
import 'package:shapmanpaypoint/utils/flutter_storage/flutter_storage.dart';

class UserAdditionalInfo {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final dio = Dio(options);
  AdditionalDetailsController addInfoController =
      Get.find<AdditionalDetailsController>();
  SecureStorage storage = SecureStorage();
  Future<void> sendRequest() async {
    try {
      final encodedData = await storage.readSecureData('ResBody');
      Map<String, dynamic> decodeData = json.decode(encodedData);
      final userId = decodeData['id'];
      print("USERD $userId");
      final payload = {
        "userId": userId,
        "fullname_company": addInfoController.fullname.value,
        "country": addInfoController.country.value,
        "state": addInfoController.state.value,
        "city": addInfoController.city.value,
        "zipcode": addInfoController.zipcode.value,
        "address": addInfoController.address.value,
      };

      final response =
          await dio.post('/user/additional/details', data: payload);
      if (response.data['Success'] == true) {
        addInfoController.userInformation.value = 1;
        Get.snackbar('', '',
            titleText: const Row(children: [
              Icon(Icons.check_circle, color: Colors.white),
              Text('Saved')
            ]),
            messageText: const Text("Data Saved Successfully"),
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green);
      } else {
        Get.snackbar('', '',
            messageText: const Text('Data Record Saving Failed'),
            titleText: const Row(
              children: [
                Icon(
                  Icons.cancel,
                  color: Colors.white,
                ),
                Text(
                  'Failed',
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: Colors.white),
                ),
              ],
            ),
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red);
      }
    } catch (error) {
      print(error);
      Get.snackbar('', '',
          messageText: const Text('Data Record Saving Failed'),
          titleText: const Row(
            children: [
              Icon(
                Icons.cancel,
                color: Colors.white,
              ),
              Text(
                'Failed',
                style:
                    TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
              ),
            ],
          ),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red);
    }
  }
}
