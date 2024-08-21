import 'package:dio/dio.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:shapmanpaypoint/controller/Loader/loader_controller.dart';
import 'package:shapmanpaypoint/services/Airtime/airtime_topup_service.dart';
import 'package:shapmanpaypoint/services/DataBundle/data_final_init_service.dart';
import 'package:shapmanpaypoint/services/Electricbill/electricbill_final_init_service.dart';
import 'package:shapmanpaypoint/services/Electricbill/electricbill_purchase_data_save.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';
import 'package:shapmanpaypoint/widgets/amountPrompt/completed_payment.dart';

class PaymentVerify {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final dio = Dio(options);
  final airtimeService = AirtimeTopupService();
  final dataService = DataTopUpService();
  final loaderController = Get.find<LoaderController>();
  final utilityService = UtilityService();
  final utilityPurchaseSave = UtilityDataSave();
  Future<Response<dynamic>> verifier(
      String? reference, title, accessCode, userid) async {
    try {
      final data = {
        'reference': reference,
        'accessCode': accessCode,
        'userId': userid
      };
      final response = await dio.post('/verifyPayment', data: data);

      if (response.data['Success'] == true &&
          response.data["message"] == "success") {
        loaderController.isChecker.value = false;

        title != "Data Top Up"
            ? airtimeService.airtimeReq()
            : dataService.databundleReq();
        Get.to(CompletedAmount(title: title));
      }
      return response;
    } on DioException catch (error) {
      loaderController.isVerifyFailed.value = true;

      rethrow;
    }
  }
}
