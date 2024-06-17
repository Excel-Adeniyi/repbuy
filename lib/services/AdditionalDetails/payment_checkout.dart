import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/assets/envied/env.dart';
import 'package:shapmanpaypoint/controller/AdditionalDetailsController/additional_detail_controller.dart';
import 'package:shapmanpaypoint/controller/Effects/on_tap.dart';
import 'package:shapmanpaypoint/controller/Loader/loader_controller.dart';
import 'package:shapmanpaypoint/services/AdditionalDetails/payment_accesscode.dart';
import 'package:shapmanpaypoint/services/AdditionalDetails/payment_verifier.dart';
import 'package:shapmanpaypoint/utils/flutter_storage/flutter_storage.dart';

class PaymentCheckoutFund {
  final PaymentServiceFunding accesscode = PaymentServiceFunding();

  final loaderController = Get.put(LoaderController());
  final ontapEffectController = Get.put(OnTapEffect());
  final stora = SecureStorage();
  final String publicKey = Env.publickey;
  AdditionalDetailsController addInfoController =
      Get.put(AdditionalDetailsController());
  final verifyPayment = PaymentVerifyFunding();
  Future<void> chargeCardPayment(BuildContext context) async {
    try {
      // Ensure Paystack SDK is initialized
      final plugin = PaystackPlugin();
      await plugin.initialize(publicKey: publicKey);
      final accessCode = await accesscode.paymentInit();
      final userData = await stora.readSecureData("ResBody");

      Map<String, dynamic> decodedData = json.decode(userData);
      final userid = decodedData['id'];
      final email = decodedData['email'];
      final dataAmount = double.parse(addInfoController.totalPrice.value);
      Charge charge = Charge()
        ..email = email
        ..amount = dataAmount.toInt() * 100
        ..accessCode = accessCode;

      // ignore: use_build_context_synchronously
      CheckoutResponse response = await plugin.checkout(context,
          charge: charge, method: CheckoutMethod.card, fullscreen: true);

      if (response.status == true) {
        ontapEffectController.isBSopen.value = true;
        loaderController.isChecker.value = true;
        final String? reference = response.reference;
        print(reference);
        verifyPayment.verifier(reference, accessCode, userid);
      } else {
        Get.toNamed('dashboard');
        Get.snackbar("", "",
            titleText: const Row(
              children: [
                Icon(
                  Icons.cancel,
                  color: Colors.white,
                ),
                Text(
                  "Failed",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                )
              ],
            ),
            messageText: const Text(
              'Funding of wallet failed',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red);
      }
    } catch (e) {
      Get.toNamed('dashboard');
      Get.snackbar("", "",
          titleText: const Row(
            children: [
              Icon(
                Icons.cancel,
                color: Colors.white,
              ),
              Text(
                "Failed",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              )
            ],
          ),
          messageText: const Text(
            'Funding of wallet failed',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red);

      rethrow;
    }
  }
}
