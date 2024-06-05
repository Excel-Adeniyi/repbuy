import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:shapmanpaypoint/controller/Auth/signup_controller.dart';
import 'package:shapmanpaypoint/controller/Loader/loader_controller.dart';
import 'package:shapmanpaypoint/controller/UserInfo/user_info.dart';
import 'package:shapmanpaypoint/controller/master_controller/master_controller.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';
import 'package:shapmanpaypoint/controller/GiftCard/gift_card_controller.dart';
import 'package:shapmanpaypoint/utils/flutter_storage/flutter_storage.dart';

class GCPaymentService {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final dio = Dio(options);
  final MasterController masterController = Get.find<MasterController>();
  final loaderController = Get.find<LoaderController>();
  // final UtilityController utilityController = Get.find<UtilityController>();
  final GiftCardController giftCardController = Get.find<GiftCardController>();
  final SecureStorage stora = SecureStorage();
  final UserInfoController _userInfo = Get.find<UserInfoController>();
  Future<String> paymentInit() async {
    final SignUpController editcontroller =
        masterController.signupIsActive.value == true
            ? Get.find<SignUpController>()
            : Get.put(SignUpController());
    final decodedToken = await stora.readSecureData('ResBody');
    Map<String, dynamic> userDecode = json.decode(decodedToken);
    try {
      var cummulativeTP =
          num.parse(giftCardController.cummulativeTotalPrice.value);
      var totalPriceToInt = cummulativeTP.toInt();
      final payload = {
        "email": editcontroller.email.text.isEmpty
            ? _userInfo.email.value
            : editcontroller.email.text,
        "amount": totalPriceToInt,
        "userId": userDecode['id']
      };
      print(payload);
      loaderController.isLoading.value = true;
      final response =
          await dio.post('/getreference', options: Options(), data: payload);
      if (response.data['success'] == true) {
        String accesscode = response.data['message'];
        loaderController.isLoading.value = false;
        return accesscode;
      } else {
        const dynamic response = "undefined";
        loaderController.isLoading.value = false;
        return response;
      }
    } catch (error) {
      loaderController.isLoading.value = false;
      rethrow;
    }
  }
}
