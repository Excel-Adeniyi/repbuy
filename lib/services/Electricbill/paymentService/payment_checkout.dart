import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/assets/envied/env.dart';
import 'package:shapmanpaypoint/controller/Auth/signup_controller.dart';
import 'package:shapmanpaypoint/controller/Effects/on_tap.dart';
import 'package:shapmanpaypoint/controller/Loader/loader_controller.dart';
import 'package:shapmanpaypoint/controller/Payment/payment_controller.dart';
import 'package:shapmanpaypoint/controller/UserInfo/user_info.dart';
import 'package:shapmanpaypoint/controller/master_controller/master_controller.dart';
import 'package:shapmanpaypoint/controller/utility_controller/utility_controller.dart';
import 'package:shapmanpaypoint/services/Airtime/airtimeTopupService.dart';
import 'package:shapmanpaypoint/services/Electricbill/paymentService/payment_service.dart';
import 'package:shapmanpaypoint/services/paymentService/payment_service.dart';
import 'package:shapmanpaypoint/services/paymentService/payment_verify.dart';
import 'package:shapmanpaypoint/utils/flutter_storage/flutter_storage.dart';

class UPaymentCheckout {
  final UPaymentService accesscode = UPaymentService();
  final MasterController masterController = Get.find<MasterController>();
  // final AirtimeCController airtimeCController = Get.find<AirtimeCController>();
  final UserInfoController userInfo = Get.find<UserInfoController>();
  final UtilityController utilityController = Get.find<UtilityController>();
  final PaymentController paymentController = Get.put(PaymentController());
  final loaderController = Get.find<LoaderController>();
  // final airtimeService = AirtimeTopupService();
  final ontapEffectController = Get.find<OnTapEffect>();
  final stora = SecureStorage();
  final String publicKey = Env.publickey;
  final verifyPayment = PaymentVerify();
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
      Charge charge = Charge()
        ..email = editcontroller.email.text.isEmpty
            ? userInfo.email.value
            : editcontroller.email.text
        ..amount = utilityController.utilityPaystackInt.value
        ..accessCode = accessCode;
        
      CheckoutResponse response = await plugin.checkout(context,
          charge: charge, method: CheckoutMethod.card, fullscreen: true);
      print(response);
      if (response.status == true) {
        ontapEffectController.isBSopen.value = true;
        loaderController.isChecker.value = true;
        final String? reference = response.reference;
        verifyPayment.verifier(reference, title, accessCode, userid);
        print(loaderController.isChecker.value);
      } else {
        Get.toNamed('');
      }
    } catch (e) {
      print('Error during checkout: $e');
      rethrow;
    }
  }
}
