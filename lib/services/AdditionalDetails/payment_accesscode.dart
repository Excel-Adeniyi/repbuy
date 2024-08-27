import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:shapmanpaypoint/controller/AdditionalDetailsController/additional_detail_controller.dart';
import 'package:shapmanpaypoint/controller/Auth/signup_controller.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';
import 'package:shapmanpaypoint/utils/flutter_storage/flutter_storage.dart';

class PaymentServiceFunding {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final dio = Dio(options);

  final SecureStorage stora = SecureStorage();
  Future<String> paymentInit() async {
    final SignUpController editcontroller = Get.put(SignUpController());

    AdditionalDetailsController addInfoController =
        Get.find<AdditionalDetailsController>();

    final decodedToken = await stora.readSecureData('ResBody');
    Map<String, dynamic> userDecode = json.decode(decodedToken);

    try {
      final payload = {
        "email": editcontroller.email.text.isEmpty
            ? userDecode['email']
            : editcontroller.email.text,
        "amount": addInfoController.amount.value,
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
