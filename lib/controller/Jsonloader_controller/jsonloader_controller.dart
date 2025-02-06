import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';

class ScreenButtonsController extends GetxController {
  final data = [].obs;
  final isloading = true.obs;
  @override
  void onInit() {
    // TODO: implement $configureLifeCycle
    super.onInit();
    getJson();
  }

  Future<List<dynamic>> getJson() async {
    final String jsonString =
        await rootBundle.loadString('lib/utils/jsons/tabs_list.json');
    data.value = jsonDecode(jsonString);
    // print('GOTTEN DATA: $data');
    return data;
  }
}
