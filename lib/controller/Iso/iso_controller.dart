import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:shapmanpaypoint/Model/ISOData/iso_model.dart';

class IsoController extends GetxController {
  final RxList<Iso> isoDetails = <Iso>[].obs;
  final selectedCountry = "Select Country".obs;
  final isoName = "Select Country".obs;

  @override
  void onInit() {
    super.onInit();
    loadIso();
  }

  Future<void> loadIso() async {
    try {
      String jsonString =
          await rootBundle.loadString('lib/utils/jsons/countryIso.json');
      // print(jsonString);
      Map<String, dynamic> jsonList = json.decode(jsonString);
      List<Iso> countryList = (jsonList["message"] as List<dynamic>)
          .map((json) => Iso.fromJson(json))
          .toList();
      isoDetails.assignAll(countryList);
      // print(countryList);
    } catch (e) {
      print('Error loading countries: $e');
    }
  }
}
