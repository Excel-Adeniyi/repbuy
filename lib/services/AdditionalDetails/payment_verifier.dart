import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:shapmanpaypoint/controller/AdditionalDetailsController/additional_detail_controller.dart';
import 'package:shapmanpaypoint/controller/AdditionalDetailsController/balance_controller.dart';
import 'package:shapmanpaypoint/controller/Loader/loader_controller.dart';
import 'package:shapmanpaypoint/controller/TransactionList/transaction_list_and_balance_controller.dart';
import 'package:shapmanpaypoint/services/AddFunds/wallet_balance.dart';
import 'package:shapmanpaypoint/services/TransactionList/transaction_list.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';

class PaymentVerifyFunding {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final dio = Dio(options);
  final walletbalance = WalletBalance();
  final translistService = TransactionList();
  final loaderController = Get.find<LoaderController>();
  final recentPurchaseController = Get.find<TransactionListController>();
  AdditionalDetailsController addInfoController =
      Get.put(AdditionalDetailsController());
  final BalanceController balanceInfo = Get.put(BalanceController());
  Future<Response<dynamic>> verifier(
      String? reference, accessCode, userid) async {
    try {
      final data = {
        "current_balance": balanceInfo.currentBalance.value +
            int.parse(addInfoController.amount.value),
        "total_overall_deposit": balanceInfo.newtotalOverallDeposit.value,
        'reference': reference,
        'accessCode': accessCode,
        'userId': userid
      };
      final response = await dio.post('/wallet/funding', data: data);

      if (response.data['Success'] == true) {
        loaderController.isChecker.value = false;
        await walletbalance.getBalance();
        await translistService
            .getTransactionList(recentPurchaseController.recentPurchase);
        Get.toNamed('dashboard');
        Get.snackbar('', '',
            messageText: const Text('Successfully funded'),
            titleText: const Row(
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.white,
                ),
                Text(
                  'Success',
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: Colors.white),
                ),
              ],
            ),
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green);
      }
      return response;
    } on DioException catch (error) {
      loaderController.isVerifyFailed.value = true;
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
                style:
                    TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
              ),
            ],
          ),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red);
      if (kDebugMode) {
        print(error);
      }
      rethrow;
    }
  }
}
