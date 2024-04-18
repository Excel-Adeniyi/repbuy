import 'package:dio/dio.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:shapmanpaypoint/controller/Loader/loader_controller.dart';
import 'package:shapmanpaypoint/services/Airtime/airtimeTopupService.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';
import 'package:shapmanpaypoint/widgets/amountPrompt/completedPayment.dart';

class PaymentVerify {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final dio = Dio(options);
  final airtimeService = AirtimeTopupService();

  final loaderController = Get.find<LoaderController>();

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
        print(response);

        airtimeService.airtimeReq();
        Get.to(CompletedAmount(title: title));
      }
      return response;
    } on DioException catch (error) {
      loaderController.isVerifyFailed.value = true;
      print(error);
      rethrow;
    }
  }
}
