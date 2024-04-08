import 'package:get/get.dart';
import 'package:shapmanpaypoint/assets/envied/env.dart';
import 'package:flutter_paystack/flutter_paystack.dart';

class PaymentController extends GetxController {
  final String publicKey = Env.publickey;
  PaystackPlugin plugin = PaystackPlugin();
  bool _sdkInitialized = false; // Flag to indicate SDK initialization status

  bool get sdkInitialized => _sdkInitialized;
  @override
  void onInit() {
    super.onInit();
    initializePaystack();
  }

  Future<void> initializePaystack() async {
    try {
      print(publicKey);
      print('Paystack SDK initialized successfully');
      return await plugin.initialize(publicKey: publicKey);

      // You can perform additional initialization steps or logic here
    } catch (e) {
      print('Error initializing Paystack SDK: $e');
      // Handle initialization error gracefully, e.g., display an error message
    }
  }
}
