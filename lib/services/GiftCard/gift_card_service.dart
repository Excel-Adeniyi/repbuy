import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:shapmanpaypoint/controller/GiftCard/gift_card_controller.dart';
import 'package:shapmanpaypoint/controller/Iso/iso_controller.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';

class GiftCardService {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final Dio dio = Dio(options);
  final IsoController isoController = Get.find<IsoController>();
  final GiftCardController giftCardController = Get.put(GiftCardController());

  // REQUEST LIST OF COUNTRY SPECIFIC GIFTCARD
  Future<Response<dynamic>> cardRequest() async {
    try {
      final isoName = isoController.isoName.value;
      if (isoName.isNotEmpty) {
        print('ISO NAME $isoName');
        final dynamic response = await dio.get('/giftcard/getcards/$isoName');
        print('REsPONSES $response');
        final List responseData = response.data['message'];
        Map<dynamic, String> responsed = {
          for (var e in responseData) e['productId']: e['productName']
        }; // Convert the iterable to a map
        if (responsed.isNotEmpty) {
          giftCardController.giftCardLister(responsed);
        }

        // print('HELLO $responsed');
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
