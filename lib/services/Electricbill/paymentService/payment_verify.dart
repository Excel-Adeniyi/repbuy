import 'package:dio/dio.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/electric/Completed/utility_status.dart';
import 'package:shapmanpaypoint/controller/Loader/loader_controller.dart';
import 'package:shapmanpaypoint/services/Electricbill/electricbill_final_init_service.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';


class UPaymentVerify {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final dio = Dio(options);
  // final airtimeService = AirtimeTopupService();
  // final dataService = DataTopUpService();
  final loaderController = Get.find<LoaderController>();
  final utilityService = UtilityService();
  Future<Response<dynamic>> verifier(
      String? reference, title, accessCode, userid, transId) async {
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

        // if(response.data[])
        utilityService.utilityReq(transId);
        Get.to(UCompletedAmount(title: title));
      }
      return response;
    } on DioException catch (error) {
      loaderController.isVerifyFailed.value = true;
      print(error);
      rethrow;
    }
  }
}
