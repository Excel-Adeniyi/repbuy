import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

Future<List<dynamic>> getJson() async {
  final String jsonString =
      await rootBundle.loadString('lib/utils/jsons/tabs_list.json');
  final data = jsonDecode(jsonString);
  print('GOTTEN DATA: $data');
  return data;
}
