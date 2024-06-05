import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:shapmanpaypoint/controller/GiftCard/gift_card_controller.dart';
import 'package:shapmanpaypoint/controller/Iso/isoController.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';

class GiftCardByIDService {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final Dio dio = Dio(options);
  // final GiftCardController  = Get.find<GiftCardController>();
  final GiftCardController giftCardController = Get.find<GiftCardController>();
  Future<Response<dynamic>> giftcardidRequest() async {
    try {
      final id = giftCardController.giftcardValue.value;
      print(id);
      if (id.isNotEmpty) {
        final dynamic response = await dio.get('/giftcard/getcard/$id');
        final dynamic responseData = response.data['message'];

        // #####ASSIGNING  RESULTS TO CONTROLLER ##########
        giftCardController.uniqueGiftCard(responseData);

        print(responseData);
        return response;
      } else {
        const dynamic nuller = "";
        return nuller;
      }
    } on DioException catch (error) {
      print(error);
      rethrow;
    }
  }
}
