import 'dart:convert';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:shapmanpaypoint/utils/flutter_storage/flutter_storage.dart';
import 'package:string_validator/string_validator.dart';

class AdditionalDetailsController extends GetxController {
  final currency = "".obs;
  final amount = "".obs;
  final fullname = "".obs;
  final country = "".obs;
  final state = "".obs;
  final city = "".obs;
  final zipcode = "".obs;
  final address = "".obs;
  final userInformation = 0.obs;
  RxString amountError = "".obs;
  RxString fullnameError = "".obs;
  RxString countryError = "".obs;
  RxString stateError = "".obs;
  RxString cityError = "".obs;
  RxString zipcodeError = "".obs;
  RxString addressError = "".obs;
  RxString transferCharge = "".obs;
  RxString localplatformCharge = "100".obs;
  RxString internationalplatformCharge = "0.7".obs;
  RxString totalPrice = "".obs;
  SecureStorage storageData = SecureStorage();

  @override
  void onInit() {
    super.onInit();
    userInfo();
  }

  Future<void> userInfo() async {
    final encodedStoredData = await storageData.readSecureData('ResBody');

    Map<String, dynamic> decodedData =
        json.decode(encodedStoredData.toString());

    final int userInformations = decodedData['userInformation'];

    userInformation.value = userInformations;
  }

  String validateCurrency(String value) {
    final currencyCheck = isAlpha(value);
    if (value.isEmpty) {
      return "Currency can't be empty";
    } else if (currencyCheck == false) {
      return "Fill the field correctly";
    } else {
      return "";
    }
  }

  String validateAmount(String value) {
    final amountCheck = isAlphanumeric(value);
    final valueInt = int.parse(value);
    // print(valueInt);
    if (value.isEmpty) {
      amountError.value = "Amount can't be empty";
      return "Amount can't be empty";
    } else if (amountCheck == false) {
      amountError.value = "Fill the field correctly";
      return "Fill the field correclty";
    } else if (currency.value == "NGN" && valueInt > 2000000) {
      amountError.value = "Amount can not exceedd 2000000";
      return "Amount can not exceedd 2000000";
    } else if (currency.value == "USD" && valueInt > 2000) {
      amountError.value = "Amount can not exceedd 20000";
      return "Amount can not exceedd 20000";
    } else {
      amountError.value = "";
      return "";
    }
  }

  String validateFullname(String value) {
    final fullnameCheck = isAscii(value);
    if (value.isEmpty) {
      fullnameError.value = "Fullname can't be empty";
      return "Fullname can't be empty";
    } else if (fullnameCheck == false) {
      fullnameError.value = "Fill the field correctly";
      return "Fill the field correctly";
    } else {
      fullnameError.value = "";
      return "";
    }
  }

  String validateCountry(String value) {
    final countryCheck = isAscii(value);
    if (value.isEmpty) {
      countryError.value = "Country can't be empty";
      return "Country can't be empty";
    } else if (countryCheck == false) {
      countryError.value = "Fill the field correctly";
      return "Fill the field correctly";
    } else {
      return "";
    }
  }

  String validateState(String value) {
    final stateCheck = isAscii(value);
    if (value.isEmpty) {
      stateError.value = "State can't be empty";
      return "State can't be empty";
    } else if (stateCheck == false) {
      stateError.value = "Fill the field correclty";
      return "Fill the field correclty";
    } else {
      stateError.value = "";
      return "";
    }
  }

  String validateCity(String value) {
    final cityCheck = isAscii(value);
    if (value.isEmpty) {
      cityError.value = "City can't be empty";
      return "City can't be empty";
    } else if (cityCheck == false) {
      cityError.value = "Fill the field correclty";
      return "Fill the field correclty";
    } else {
      cityError.value = "";
      return "";
    }
  }

  String validateZipCode(String value) {
    final zipcodeCheck = isNumeric(value);
    if (value.isEmpty) {
      zipcodeError.value = "zipcode  can't be empty";
      return "zipcode  can't be empty";
    } else if (zipcodeCheck == false) {
      zipcodeError.value = "Fill the field correctly";
      return "Fill the field correctly";
    } else {
      zipcodeError.value = "";
      return "";
    }
  }

  String validateAddress(String value) {
    final addressCheck = isAscii(value);
    if (value.isEmpty) {
      addressError.value = "Address  can't be empty";
      return "Address  can't be empty";
    } else if (addressCheck == false) {
      addressError.value = "Fill the field correctly";
      return "Fill the field correctly";
    } else {
      addressError.value = "";
      return "";
    }
  }

  void calculateServiceCharge() {
    if (currency.value == "NGN" && int.parse(amount.value) > 2000) {
      final num localCharge = (num.parse(amount.value) * 0.015) + 100;
      transferCharge.value = localCharge.toString();
    } else if (currency.value == "USD") {
      final num internationalCharge = (num.parse(amount.value) * 0.039) + 0.4;
      transferCharge.value = internationalCharge.toString();
    } else {
      transferCharge.value = "0";
    }
  }

  void totalPriceCharge() {
    if (transferCharge.value.isNotEmpty && currency.value == "NGN") {
      final outcome = num.parse(transferCharge.value) +
          num.parse(localplatformCharge.value) +
          num.parse(amount.value);
      totalPrice.value = outcome.toString();
    } else if (transferCharge.value.isNotEmpty && currency.value == "USD") {
      final outcome = num.parse(transferCharge.value) +
          num.parse(internationalplatformCharge.value) +
          num.parse(amount.value);

      totalPrice.value = outcome.toString();
    }
  }

  String formatPrice() {
    NumberFormat numberFormat = NumberFormat('#,##0.00', 'en_us');
    final convertdouble = num.parse(totalPrice.value);
    final formattedOutput = numberFormat.format(convertdouble);
    return formattedOutput;
  }
}
