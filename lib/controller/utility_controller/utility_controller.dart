import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Model/UtilityModel/utility_model.dart';

class UtilityController extends GetxController {
  final RxList<UtilityModel> utilityPlan = <UtilityModel>[].obs;
  final RxString utilityPackage = "Select Service".obs;
  final RxString utilityServiceType = "".obs;
  final RxDouble minITA = 00.0.obs;
  final RxDouble maxITA = 00.0.obs;
  final RxBool minSmall = false.obs;
  final RxBool maxBig = false.obs;
  final RxString utilityProvider = ''.obs;
  final RxString utilityName = ''.obs;
  final RxBool isMeterComplete = false.obs;
  final RxString billerMeter = "".obs;
  final RxString purchasePrice = "".obs;
  final RxInt commission = 100.obs;
  final RxDouble vat = 7.50.obs;
  final RxInt utilityPaystackInt = 0.obs;
  final RxString utilitySum = ''.obs;
  // final RxString maxamount = 10.obs;
  TextEditingController valuers = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    loadUtilityJson();
  }

  Future<void> loadUtilityJson() async {
    try {
      final String jsonString =
          await rootBundle.loadString('lib/utils/jsons/utility.json');
      Map<String, dynamic> jsonList = json.decode(jsonString);
      List<UtilityModel> utilityList = [];
      print(jsonList);
      if (jsonList['content'] != null) {
        utilityList = (jsonList['content'] as List<dynamic>)
            .map((jsondata) => UtilityModel.fromJson(jsondata))
            .toList();
        print("HEY");
      }
      print("worked");
      utilityPlan.assignAll(utilityList);
      print(utilityPlan);
    } catch (e) {
      print("Error in Utility Controller Function $e");
    }
  }

  void handleSelectedPackage(String value) {
    utilityPackage.value = value;
    utilityPlan.firstWhere((data) {
      if (data != null && data.id != null) {
        utilityServiceType.value = data.serviceType;
        minITA.value = data.minInternationalTransactionAmount;
        maxITA.value = data.maxInternationalTransactionAmount;
        utilityName.value = data.name;
        valuers.text = maxITA.toString();
        update();
        return data.id.toString() == utilityPackage.value;
      } else {
        null;
        return false;
      }
    });
  }

  void amountValidator(String value) {
    // print(value);
    if (value.isNotEmpty) {
      final newValue = double.parse(value);
      if (value.isNotEmpty &&
          newValue < minITA.value &&
          !newValue.isNaN &&
          newValue != 0.0) {
        minSmall.value = true;
        maxBig.value = false;
        update();
      } else if (newValue > maxITA.value) {
        maxBig.value = true;
        minSmall.value = false;
        update();
      } else {
        minSmall.value = false;
        maxBig.value = false;
        purchasePrice.value = value;
        update();
      }
    } else {
      minSmall.value = false;
      maxBig.value = false;

      update();
    }
  }

  void meterValidator(String value) {
    if (value.length < 10 && value.isNotEmpty) {
      isMeterComplete.value = true;
      update();
    } else {
      isMeterComplete.value = false;
      billerMeter.value = value;
      update();
    }
  }

  Widget showError() {
    return minSmall.value == true
        ? Text(
            "Amount can't be less than ${minITA.value}",
            style: const TextStyle(color: Colors.red, fontSize: 12),
          )
        : maxBig.value == true
            ? Text(
                "Amount can't be greater than ${maxITA.value}",
                style: const TextStyle(color: Colors.red, fontSize: 12),
              )
            : const SizedBox.shrink();
  }

  Widget meterError() {
    return isMeterComplete.value == true
        ? const Text("Meter number is less than 10",
            style: TextStyle(color: Colors.red, fontSize: 12))
        : const SizedBox.shrink();
  }

  void purchaseSum() {
    final billeramount = int.parse(purchasePrice.value);
    final summation = billeramount + commission.value + vat.value;
    final sumString = summation.toString();
    final paystackAmount = sumString;
    print("CHECKPAY" + paystackAmount);
    utilitySum.value = sumString;
    final double paystactDouble = double.parse(paystackAmount);
    final paystackRounded = paystactDouble * 100;
    final paystackInt = paystackRounded.toInt();
    utilityPaystackInt.value = paystackInt;
    print(utilityPaystackInt.value);
    update();
  }

  void splicer() {
    if (utilityName.value.isNotEmpty) {
      final uname = utilityName.value;
      print(utilityName);
      final split = uname.split(' ');
      final Map<int, String> provider = {
        for (int i = 0; i < split.length; i++) i: split[i]
      };
      if (split.length < 4) {
        final fname = provider[0].toString();
        final lname = provider[1].toString();
        print(lname);
        utilityProvider.value = '$fname $lname';
        print(utilityProvider.value);
      } else {
        final fname = provider[0];
        final lname = provider[1];
        final oname = provider[2];
        utilityProvider.value = '$fname $lname $oname';
      }
    }
  }
}
