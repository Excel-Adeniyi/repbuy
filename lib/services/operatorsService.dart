import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:shapmanpaypoint/controller/AirtimeTopUp/airtimeController.dart';

import 'package:shapmanpaypoint/controller/Iso/isoController.dart';
import 'package:shapmanpaypoint/controller/contact_picker/contact_picker.dart';
import 'package:shapmanpaypoint/controller/rechargeController.dart';

import '../utils/flutter_storage/flutter_storage.dart';

class FetchOperatorService {
  static BaseOptions options = BaseOptions(
    baseUrl: "http://172.21.67.29:2110",
    connectTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 3),
  );
  final Dio dio = Dio(options);
  final SecureStorage stora = SecureStorage();
  final IsoController isoController = Get.find<IsoController>();
  final ContactPickerController contactController =
      Get.put(ContactPickerController());
  final AirtimeCController _airtimeCController = Get.put(AirtimeCController());
  final RechargeController rechargeText = Get.find<RechargeController>();
  Future<Response<dynamic>> operators() async {
// Obtain shared preferences.
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final dataReq = {
        "phone": contactController.phonController.phoneController.text,
        "isoName": isoController.selectedCountry.value
      };
      print(dataReq);
      final response =
          await dio.post('/operator', options: Options(), data: dataReq);
      print(response);
      // print("HELLO ${response.data['success']}");r
      // final List<dynamic> resData = [];

      if (response.data != null) {
        // print("HI");
        print(response.data['operatorId']);
        print(response.data['name']);
        print(rechargeText.amountCont.text);

        _airtimeCController.operatorId.value =
            response.data['operatorId'].toString();
        _airtimeCController.countryCode.value =
            response.data['country']["isoName"];
        _airtimeCController.network.value = response.data['name'];
        _airtimeCController.amount.value = rechargeText.amountCont.text;
        _airtimeCController.number.value = rechargeText.phoneController.text;
        print(_airtimeCController.operatorId.value);
        // await stora.writeSecureData("X-csrf", response.data['message']);
      } else {
        print('NAN');
      }
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
