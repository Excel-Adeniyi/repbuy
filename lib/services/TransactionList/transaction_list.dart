import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/instance_manager.dart';
import 'package:shapmanpaypoint/Model/TransactionListModel/transaction_list_model.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';
import 'package:shapmanpaypoint/utils/flutter_storage/flutter_storage.dart';

class TransactionList {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  // final transController = Get.put<TransactionListController>();
  final Dio dio = Dio(options);
  Future<Response<dynamic>> getTransactionList(
      RxList<TransactionListModel> transactionList) async {
    final SecureStorage stora = SecureStorage();
    try {
      // loaderController.isLoading.value = true;
      final decodedToken = await stora.readSecureData('ResBody');
      Map<String, dynamic> userDecode = json.decode(decodedToken);
      final userId = userDecode['id'].toString();
      final response = await dio.get('/purchase/list/$userId');
      // print(response.data);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = response.data;
        // print(jsonData);
        // final transactionListResponse =
        //     TransactionsListReponse.fromJson(jsonData);
        // print('TRANSSS $transactionListResponse');
        final bool success = jsonData['Success'];
        final List<dynamic> message = jsonData['message'];

        if (success == true && message.isNotEmpty) {
          final List<TransactionListModel> listResponse = message
              .map((item) => TransactionListModel.fromJson(item))
              .toList();
          print(listResponse);
          transactionList.value = listResponse;
          // if (transactionListResponse.successs) {
          //   transactionList.value =
          //       transactionListResponse.message as RxList<TransactionListModel>;
        } else {
          Get.snackbar("Empty", "Unable to fetch get undefined",
              backgroundColor: Colors.red, colorText: Colors.white);
        }

        // transController.recentPurchase.value = listResponse;
      }
      return response;
    } catch (error) {
      // loaderController.isLoading.value = true;
      Get.snackbar("Error", "Unable to fetch get undefined",
          backgroundColor: Colors.red, colorText: Colors.white);
      rethrow;
    }
  }
}
