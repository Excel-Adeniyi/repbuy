import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/assets/envied/env.dart';
import 'package:shapmanpaypoint/controller/Auth/signup_controller.dart';
import 'package:shapmanpaypoint/controller/Effects/on_tap.dart';
import 'package:shapmanpaypoint/controller/GiftCard/gift_card_controller.dart';
import 'package:shapmanpaypoint/controller/Loader/loader_controller.dart';
import 'package:shapmanpaypoint/controller/Payment/payment_controller.dart';
import 'package:shapmanpaypoint/controller/UserInfo/user_info.dart';
import 'package:shapmanpaypoint/controller/master_controller/master_controller.dart';
import 'package:shapmanpaypoint/services/GiftCard/paymentService/payment_service.dart';
import 'package:shapmanpaypoint/services/GiftCard/paymentService/payment_verify.dart';
import 'package:shapmanpaypoint/utils/flutter_storage/flutter_storage.dart';

class GCPaymentCheckout {
  final GCPaymentService accesscode = GCPaymentService();
  final MasterController masterController = Get.find<MasterController>();
  // final AirtimeCController airtimeCController = Get.find<AirtimeCController>();
  final UserInfoController userInfo = Get.find<UserInfoController>();
  final GiftCardController giftCardController = Get.find<GiftCardController>();
  final PaymentController paymentController = Get.put(PaymentController());
  final loaderController = Get.find<LoaderController>();
  // final airtimeService = AirtimeTopupService();
  final ontapEffectController = Get.find<OnTapEffect>();
  final stora = SecureStorage();
  final String publicKey = Env.publickey;
  final verifyPayment = GiftCardPaymentVerify();
  Future<void> chargeCardPayment(BuildContext context, title) async {
    final SignUpController editcontroller =
        masterController.signupIsActive.value == true
            ? Get.find<SignUpController>()
            : Get.put(SignUpController());
    try {
      // Ensure Paystack SDK is initialized
      final plugin = PaystackPlugin();
      await plugin.initialize(publicKey: publicKey);
      final accessCode = await accesscode.paymentInit();
      final userData = await stora.readSecureData("ResBody");

      Map<String, dynamic> decodedData = json.decode(userData);
      final userid = decodedData['id'];
      print("Checking");
      var amountInt = num.parse(giftCardController.cummulativeTotalPrice.value);
      var convertAmountFromIntTODouble = amountInt.toInt() * 100;
      Charge charge = Charge()
        ..email = editcontroller.email.text.isEmpty
            ? userInfo.email.value
            : editcontroller.email.text
        ..currency =
            giftCardController.senderCurrencyCode.value != "NGN" ? "USD" : "NGN"
        ..amount = convertAmountFromIntTODouble
        ..accessCode = accessCode;

      CheckoutResponse response = await plugin.checkout(context,
          charge: charge, method: CheckoutMethod.card, fullscreen: true);
      print(response);
      if (response.status == true) {
        ontapEffectController.isBSopen.value = true;
        loaderController.isChecker.value = true;
        final String? reference = response.reference;
        // const title = "Utility";
        verifyPayment.verifier(reference, title, accessCode, userid);
        print(loaderController.isChecker.value);
      } else {
        
      }
    } catch (e) {
      print('Error during checkout: $e');
      rethrow;
    }
  }
}
