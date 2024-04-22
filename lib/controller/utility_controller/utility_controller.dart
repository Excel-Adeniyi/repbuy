import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Model/UtilityModel/utility_model.dart';

class UtilityController extends GetxController {
  final RxList<UtilityModel> utilityPlan = <UtilityModel>[].obs;
  final RxString utilityPackage = "Select Service".obs;
  final RxString utilityServiceType = "".obs;
  final RxString minITA = "".obs;
  final RxString maxITA = "".obs;

  Future<void> loadUtilityJson() async {
    try {
      final String jsonString =
          await rootBundle.loadString('lib/utils/jsons/utility.json');
      Map<String, dynamic> jsonList = json.decode(jsonString);
      List<UtilityModel> utilityList = [];
      if (jsonList['content'] != null) {
        utilityList = (jsonList['content'] as List<dynamic>)
            .map((jsondata) => UtilityModel.fromJson(jsondata))
            .toList();
      }
      utilityPlan.assignAll(utilityList);
    } catch (e) {
      print("Error in Utility Controller Function $e");
    }
  }
}
