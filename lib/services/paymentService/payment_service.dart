import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:shapmanpaypoint/controller/AirtimeTopUp/airtimeController.dart';
import 'package:shapmanpaypoint/controller/Auth/signup_controller.dart';
import 'package:shapmanpaypoint/controller/DataBundle/data_bundle.dart';
import 'package:shapmanpaypoint/controller/UserInfo/user_info.dart';
import 'package:shapmanpaypoint/controller/master_controller/master_controller.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';
import 'package:shapmanpaypoint/utils/flutter_storage/flutter_storage.dart';

class PaymentService {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final dio = Dio(options);
  final MasterController masterController = Get.find<MasterController>();
  final AirtimeCController airtimeCController = Get.find<AirtimeCController>();
  final SecureStorage stora = SecureStorage();
  final UserInfoController _userInfo = Get.find<UserInfoController>();
  final _databundleController = Get.put(DataBundleController());
  Future<String> paymentInit() async {
    final SignUpController editcontroller =
        masterController.signupIsActive.value == true
            ? Get.find<SignUpController>()
            : Get.put(SignUpController());
    final decodedToken = await stora.readSecureData('ResBody');
    Map<String, dynamic> userDecode = json.decode(decodedToken);
    try {
      final payload = {
        "email": editcontroller.email.text.isEmpty
            ? _userInfo.email.value
            : editcontroller.email.text,
        "amount": airtimeCController.amount.value != ""
            ? airtimeCController.amount.value
            : _databundleController.priceController.text,
        "userId": userDecode['id']
      };

      final response =
          await dio.post('/getreference', options: Options(), data: payload);
      if (response.data['success'] == true) {
        String accesscode = response.data['message'];
        return accesscode;
      } else {
        const dynamic response = "undefined";
        return response;
      }
    } catch (error) {
      rethrow;
    }
  }
}
