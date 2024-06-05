import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:shapmanpaypoint/controller/GiftCard/gift_card_controller.dart';
import 'package:shapmanpaypoint/controller/Purchase_successful/purchase_controller.dart';
import 'package:shapmanpaypoint/controller/otp/otp_controller.dart';
import 'package:shapmanpaypoint/controller/utility_controller/utility_controller.dart';
import 'package:shapmanpaypoint/services/Electricbill/electric_purchase_verify.dart';
import 'package:shapmanpaypoint/services/Electricbill/electricbill_purchase_data_save.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';
import '../../utils/flutter_storage/flutter_storage.dart';

class GiftcardFinalService {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final Dio dio = Dio(options);

  final OTPController otpController = Get.put(OTPController());

  final SecureStorage stora = SecureStorage();
  // final dataPurchaseService = DataPurchaseService();
  final PurchaseResponse purchasecontroller = Get.put(PurchaseResponse());
  final GiftCardController giftCardController = Get.find<GiftCardController>();
  // final utilityVerifier = UtilityVerify();
  // final utilityPurchaseSave = UtilityDataSave();
  Future<Response<dynamic>> gcpaymentReq() async {
    final decodedToken = await stora.readSecureData('ResBody');
    Map<String, dynamic> userDecode = json.decode(decodedToken);
    final userId = userDecode['id'];
    final String userUniqueId = userDecode['last_mame'] + userId.toString();
    final String userName =
        userDecode['first_name'] + ' ' + userDecode['last_mame'];
    purchasecontroller.isLoading.value = true;
    try {
      print("ACTIVE IN GCIS");
      final dataReq = {
        "userId": userId,
        "unitPrice": num.parse(giftCardController.giftcardPriceKey.value),
        "amount": giftCardController.totalPrices.value,
        "quantity": int.parse(giftCardController.giftcardQuantity.value),
        "productId": int.parse(giftCardController.giftcardValue.value),
        "customIdentifier": userUniqueId,
        "senderName": userName,
        "recipientEmail": giftCardController.recipientemaill.value.isNotEmpty
            ? giftCardController.recipientemaill.value
            : "SOMETHING",
        "recipientPhoneDetails": {
          "countryCode": giftCardController.recipientCountryCode.value,
          "phoneNumber": giftCardController.recipientphoneNumber.value
        },
        "preOrder": false
      };
      final response = await dio.post('/giftcard/order', data: dataReq);
      if (kDebugMode) {
        print("HIIH $response");
      }
      otpController.pinController.value = '';
      const value = '';
      final pid = response.data['message']['id'];
      if (kDebugMode) {
        print('PRINTING PID $pid');
      }
      otpController.checkOTP(value);
      if (response.data['Success'] == true) {
        if (response.data['message']['status'] == "PROCESSING") {
          purchasecontroller.pending.value = true;
          // utilityPurchaseSave.sendReq();
          // utilityController.processMessage.value =
          //     response.data['message']['message'];
          // utilityVerifier.utilityVerify(pid);
        } else {
          null;
        }
        purchasecontroller.isLoading.value = false;
        purchasecontroller.rsuccess.value = response.data['message'].toString();
        purchasecontroller.dataRx.value = true;
        purchasecontroller.allowDisplay.value = true;
      } else {
        purchasecontroller.dataRx.value = false;
        otpController.pinController.value = '';
      }
      return response;
    } on DioException catch (error) {
      if (kDebugMode) {
        print(error);
      }
      if (error.response?.statusCode == 401) {
        Get.snackbar(
          "",
          "",
          titleText: const Text(
            "Request Failed",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          messageText: const Row(
            children: [
              Icon(
                Icons.cancel_outlined,
                color: Colors.white,
              ),
              Text("Access Unauthorized", style: TextStyle(color: Colors.white))
            ],
          ),
          backgroundColor: Colors.red,
          showProgressIndicator: true,
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.toNamed('/dashboard');
        rethrow;
      }

      if (error.response?.statusCode == 408) {
        Get.snackbar(
          "",
          "",
          titleText: const Text(
            "Request Failed",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          messageText: Row(
            children: [
              const Icon(
                Icons.cancel_outlined,
                color: Colors.white,
              ),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                      "Dear User, We're Unable to complete purchase right now, Please try again later",
                      overflow: TextOverflow.clip,
                      style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
          backgroundColor: Colors.red,
          showProgressIndicator: true,
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.toNamed('/dashboard');
        rethrow;
      }
      if (error.response?.statusCode == 503) {
        Get.snackbar(
          "",
          "",
          titleText: const Text(
            "Response Failed",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          messageText: Row(
            children: [
              const Icon(
                Icons.cancel_outlined,
                color: Colors.white,
              ),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text("Purchase is not completed",
                      overflow: TextOverflow.clip,
                      style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
          backgroundColor: Colors.red,
          showProgressIndicator: true,
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.toNamed('/dashboard');
        rethrow;
      }
      print('RUFUS');
      purchasecontroller.isLoading.value = false;
      purchasecontroller.dataRx.value = false;
      otpController.pinController.value = '';

      rethrow;
    } finally {
      purchasecontroller.isLoading.value = false;
      otpController.pinController.value = '';
    }
  }
}
