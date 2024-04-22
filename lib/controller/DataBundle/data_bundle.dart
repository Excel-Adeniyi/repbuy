import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Model/DataBundle/data_bundle_model.dart';
import 'package:shapmanpaypoint/controller/master_controller/master_controller.dart';

class DataBundleController extends GetxController {
  final RxList<Datapackage> selectPackkage = <Datapackage>[].obs;
  final RxString selectedPName = 'Select Provider'.obs;
  final RxString selectedCountryIso = 'Select Country'.obs;
  final RxString selectedLogoUrls = ''.obs;
  final RxString newSelectedPName = 'Select'.obs;
  final RxString selectedFixedAmountDes = "00.0".obs;
  final RxString selectedFixedValues = "".obs;
  final RxString selectedFixed = "".obs;
  final RxString selectedPackageName = "".obs;
  final RxString currencySelector = ''.obs;
  final TextEditingController priceController = TextEditingController();
  final MasterController masterController = Get.find<MasterController>();
  final RxList<MapEntry<String, dynamic>> dropdownItems =
      <MapEntry<String, dynamic>>[].obs;
  final RxBool valueChanged = false.obs;
  @override
  void onInit() {
    super.onInit();
    loadDatabundle();
    masterController.databundleController.value = true;
  }

  @override
  void onClose() {
    selectedPName.value = "";
    selectedFixedAmountDes.value = "";
    super.onClose();
  }

  Future<void> loadDatabundle() async {
    try {
      final String jsonString =
          await rootBundle.loadString('lib/utils/jsons/data_operators.json');
      Map<String, dynamic> jsonList = json.decode(jsonString);
      List<Datapackage> dataList = [];
      if (jsonList["operators"] != null) {
        // Check for null data

        dataList = (jsonList["operators"] as List<dynamic>)
            .map((json) => Datapackage.fromJson(json))
            .toList();
      }

      print(dataList);
      selectPackkage.assignAll(dataList);
    } catch (e) {
      print("Error loading datapackage $e");
    }
  }

  void changedData(String newValue) {
    if (selectedPName.value != newValue) {
      // selectedFixedAmountDes.value = '';
      valueChanged.value = true;
    }
  }

  void updateSelectedFixedAmountDes(String newValue) {
    selectedFixedAmountDes.value = newValue;

    update();
  }

  void findPriceValueCurrency() {
    final provider = selectedPName.value;
    final bundle = selectedFixedAmountDes.value;
    print(bundle);
    final currentProvider = selectPackkage.firstWhere(
      (data) => data.operatorId.toString() == provider,
    );
    
     // Handling the case where provider is not found
    print(currentProvider);


    currencySelector.value =
        currentProvider.destinationCurrencySymbol as String;

        
    final selectedValue = currentProvider.fixedAmountsDescriptions.entries
        .firstWhere((valuess) => valuess.key == bundle, orElse: () {
      return const MapEntry('', '');
    }); // Handling the case where bundle is not found

    currencySelector.value =
        selectedCountryIso.value = currentProvider.country["isoName"];
    currentProvider.destinationCurrencySymbol as String;
    selectedFixedValues.value = selectedValue.value;
    update();
  }

  void updateDropdownItems(Map<String, dynamic> newData) {
    // Your logic to update the list of items
    dropdownItems.clear();
    print("BABAYGA $newData");
    newData.forEach((key, value) {
      dropdownItems.add(MapEntry(key, value));
      // Adding both key and value
    });
    update();
  }
}
