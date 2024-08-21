import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:shapmanpaypoint/controller/AirtimeTopUp/airtimeController.dart';

import 'package:shapmanpaypoint/controller/Iso/iso_controller.dart';
import 'package:shapmanpaypoint/controller/Loader/loader_controller.dart';
import 'package:shapmanpaypoint/controller/contact_picker/contact_picker.dart';
import 'package:shapmanpaypoint/controller/rechargeController.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';

import '../utils/flutter_storage/flutter_storage.dart';

class FetchOperatorService {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final Dio dio = Dio(options);
  final SecureStorage stora = SecureStorage();
  final IsoController isoController = Get.find<IsoController>();
  final ContactPickerController contactController =
      Get.find<ContactPickerController>();
  final AirtimeCController _airtimeCController = Get.put(AirtimeCController());
  final RechargeController rechargeText = Get.find<RechargeController>();
  final LoaderController _loaderController = Get.find<LoaderController>();
  Future<Response<dynamic>> operators() async {
    try {
      final dataReq = {
        "phone": contactController.phonController.phoneController.text,
        "isoName": isoController.isoName.value
      };
      // print(dataReq);
      _loaderController.isLoading.value = true;
      final response =
          await dio.post('/operator', options: Options(), data: dataReq);
      // print(response);
      // print("HELLO ${response.data['success']}");r
      // final List<dynamic> resData = [];

      if (response.data != null) {
        // print("HI");
        // print(response.data['operatorId']);
        // print(response.data['name']);
        // print(rechargeText.amountCont.text);
        _loaderController.isLoading.value = false;
        _airtimeCController.operatorId.value =
            response.data['operatorId'].toString();
        _airtimeCController.countryCode.value =
            response.data['country']["isoName"];
        _airtimeCController.network.value = response.data['name'];
        _airtimeCController.amount.value = rechargeText.amountCont.text;
        _airtimeCController.number.value = rechargeText.phoneController.text;
        // print(_airtimeCController.operatorId.value);
        // await stora.writeSecureData("X-csrf", response.data['message']);
      } else {
        // print('NAN');
        _loaderController.isLoading.value = true;
      }
      return response;
    } catch (error) {
      // print("ANA $error");
      _loaderController.isLoading.value = true;
      rethrow;
    } finally {
      _loaderController.isLoading.value = false;
    }
  }
}
