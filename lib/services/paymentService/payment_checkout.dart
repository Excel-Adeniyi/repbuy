import 'package:flutter/widgets.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/assets/envied/env.dart';
import 'package:shapmanpaypoint/controller/AirtimeTopUp/airtimeController.dart';
import 'package:shapmanpaypoint/controller/Auth/signup_controller.dart';
import 'package:shapmanpaypoint/controller/Payment/payment_controller.dart';
import 'package:shapmanpaypoint/controller/UserInfo/user_info.dart';
import 'package:shapmanpaypoint/services/paymentService/payment_service.dart';

class PaymentCheckout {
  final PaymentService accesscode = Get.find<PaymentService>();
  final SignUpController editcontroller = Get.find<SignUpController>();
  final AirtimeCController airtimeCController = Get.find<AirtimeCController>();
  final UserInfoController userInfo = Get.find<UserInfoController>();
  final PaymentController paymentController = Get.find<PaymentController>();
  final String publicKey = Env.publickey;
  Future<void> chargeCardPayment(BuildContext context) async {
    try {
      // Ensure Paystack SDK is initialized
      final plugin = PaystackPlugin();
      await plugin.initialize(publicKey: publicKey);
      print("Checking");
      Charge charge = Charge()
        ..email = editcontroller.email.text.isEmpty
            ? userInfo.email.value
            : editcontroller.email.text
        ..amount = int.parse(airtimeCController.amount.value) * 100
        ..reference = '${DateTime.now().millisecondsSinceEpoch}';

      CheckoutResponse response = await plugin.checkout(
        context,
        charge: charge,
        method: CheckoutMethod.card,
      );
      print(response);
    } catch (e) {
      print('Error during checkout: $e');
      rethrow;
    }
  }
}
