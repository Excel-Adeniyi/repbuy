import 'package:get/get.dart';

class PhoneController extends GetxController {
  final phoneNumber = ''.obs;
  final amountField = ''.obs;
  final enableButton = false.obs;
  String? validatePhoneNumber(String? value) {
    if (value != null && value.length < 10) {
      return "Phone number less than required";
    }
    return null;
  }

  String? validateAmountField(String? value) {
    final intAmount = int.tryParse(value ?? '');

    if (intAmount != null && intAmount < 50) {
      return "Price must not be less than 50";
    } else if (intAmount != null && intAmount > 250001) {
      return "Price must not be greater than 250,000";
    }
    return null;
  }
}
