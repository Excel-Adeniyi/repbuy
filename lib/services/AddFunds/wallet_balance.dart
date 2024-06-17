import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/AdditionalDetailsController/balance_controller.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';
import 'package:shapmanpaypoint/utils/flutter_storage/flutter_storage.dart';

class WalletBalance {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final dio = Dio(options);
  final SecureStorage stora = SecureStorage();
  BalanceController balanceController = Get.put(BalanceController());
  Future<void> getBalance() async {
    final decodedToken = await stora.readSecureData('ResBody');
    Map<String, dynamic> userDecode = json.decode(decodedToken);
    final userId = userDecode['id'];
    try {
      final response = await dio.get('/wallet/balance/$userId');
      if (response.data['Success'] == true) {
        balanceController.lastDepositAmount.value =
            response.data['message'][0]['last_deposit_amount'];
        balanceController.currentBalance.value =
            response.data['message'][0]['current_balance'];
        balanceController.totalOverallDeposit.value =
            response.data['message'][0]['total_overall_deposit'] ?? 0;
      } else {
        Get.snackbar('', '',
            messageText: const Text('Funding of account not successful'),
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
      Get.snackbar('', '',
          messageText: const Text('Server Error'),
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
      rethrow;
    }
  }
}
