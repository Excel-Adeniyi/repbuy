import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:shapmanpaypoint/controller/GiftCard/gift_card_controller.dart';
import 'package:shapmanpaypoint/controller/Purchase_successful/purchase_controller.dart';
import 'package:shapmanpaypoint/controller/otp/otp_controller.dart';
import 'package:shapmanpaypoint/utils/Getters/base_url.dart';
import 'package:shapmanpaypoint/utils/flutter_storage/flutter_storage.dart';

class GiftCardSaveDataFirst {
  static BaseOptions options = BaseOptions(
    baseUrl: Constants.base_url,
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
  );
  final Dio dio = Dio(options);
  final OTPController otpController = Get.put(OTPController());

  final SecureStorage stora = SecureStorage();
  final PurchaseResponse purchasecontroller = Get.put(PurchaseResponse());
  final GiftCardController giftCardController = Get.find<GiftCardController>();
  Future<void> sendTransfer() async {
    final decodedToken = await stora.readSecureData('ResBody');
    Map<String, dynamic> userDecode = json.decode(decodedToken);
    final userId = userDecode['id'];
    final String userUniqueId =
        userId.toString() + DateTime.now().microsecondsSinceEpoch.toString();
    final String userName =
        userDecode['first_name'] + ' ' + userDecode['last_mame'];
    purchasecontroller.isLoading.value = true;

    final dataReq = {
      "userId": userId,
      "product_type": "GiftCard",
      "unitPrice": num.parse(giftCardController.giftcardPriceKey.value),
      "amount": giftCardController.totalPrices.value,
      "quantity": int.parse(giftCardController.giftcardQuantity.value),
      "productId": int.parse(giftCardController.giftcardValue.value),
      "customIdentifier": userUniqueId,
      "senderName": userName,
      "recipientEmail": giftCardController.recipientemaill.value.isNotEmpty
          ? giftCardController.recipientemaill.value
          : "SOMETHING",
      "recipientPhoneDetails": {
        "countryCode": giftCardController.recipientCountryCode.value,
        "phoneNumber": giftCardController.recipientphoneNumber.value
      },
      "preOrder": false
    };

    try {
      final response = await dio.post('/giftcard/save/bpayment', data: dataReq);
      final ntransactionId = response.data['message'][0]['ntransactionId'];
      giftCardController.ntransactionId.value = ntransactionId;
    } catch (error) {
      rethrow;
    }
  }
}
