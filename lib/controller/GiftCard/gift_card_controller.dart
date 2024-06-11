import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GiftCardController extends GetxController {
  RxInt currentStep = 0.obs;
  RxMap giftcardList = <dynamic, String>{}.obs;
  final giftcardValue = '0'.obs;
  final giftcardPriceKey = '0.00'.obs;
  final giftCardPriceValue = '0'.obs;
  final cardImages = [].obs;
  final giftcardQuantity = '0'.obs;
  final giftcardCommission = "".obs;
  final totalPrices = "".obs;
  final commissionPrice = "".obs;
  final initialPrice = "".obs;
  RxList<Step> steppers = <Step>[].obs;
  final cummulativeTotalPrice = "".obs;
  final formattedCTP = "".obs;
  final RxString recipientphoneNumber = "".obs;
  final RxString recipientemaill = "".obs;
  final RxString recipientCountryCode = "".obs;
  final phoneNumberValidated = false.obs;
  final emailValidated = false.obs;
  final countryCodeValidated = false.obs;

  //##### RESUlt GOTTEN FROM THE ID ######
  RxString productName = ''.obs;
  RxMap fixedRecipientToSenderDenominationsMap = {}.obs;
  RxString senderFee = ''.obs;
  RxString logoUrls = ''.obs;
  RxString countryFlagUrl = ''.obs;
  RxString redeemInstruction = ''.obs;
  RxString brandName = ''.obs;
  RxString senderCurrencyCode = ''.obs;
  RxInt productId = 0.obs;
  //###### AUtH SERVICE #######

  final valueConverter = NumberFormat("#,###.00", "en_US");
  @override
  void onInit() {
    super.onInit();
    loadImages();
  }

  bool currentSttep(int value) {
    if (!value.isNaN) {
      if (currentStep.value == value) {
        return true;
      }
      // update();
      return false;
    }
    return false;
  }

  // print(giftCardController.currentSttep(0));
  Future<void> loadImages() async {
    try {
      String jsonString =
          await rootBundle.loadString('lib/utils/jsons/images.json');
      // print(jsonString);
      Map<String, dynamic> jsonList = json.decode(jsonString);
      List imagesList = (jsonList["images"] as List<dynamic>).toList();
      cardImages.assignAll(imagesList);
      // print(countryList);
    } catch (e) {
      print('Error loading countries: $e');
    }
  }

  void giftCardLister(Map<dynamic, String> responsed) {
    giftcardList.clear();
    giftcardValue.value = '0';
    if (responsed.values != giftcardList.values) {
      giftcardList.addAll(responsed);
      update();
    }
  }

  void uniqueGiftCard(dynamic responseData) {
    productName.value = '';
    productId.value = 0;
    fixedRecipientToSenderDenominationsMap.clear();
    senderFee.value = '';
    logoUrls.value = '';
    countryFlagUrl.value = '';
    redeemInstruction.value = '';
    brandName.value = '';
    senderCurrencyCode.value = '';
    giftcardPriceKey.value = '0.00';
    initialPrice.value = "";
    giftcardQuantity.value = "0";
    giftCardPriceValue.value = '0';
    print(responseData);
    if (responseData != null) {
      productName.value = responseData['productName'];
      productId.value = 0;
      final fixedDominations =
          responseData['fixedRecipientToSenderDenominationsMap'];
      print("PRINCE PRICE: $fixedDominations");
      fixedRecipientToSenderDenominationsMap.addAll(fixedDominations);
      senderFee.value = responseData['senderFee'].toString();
      logoUrls.value = responseData['logoUrls'][0];
      senderCurrencyCode.value = responseData['senderCurrencyCode'];
      countryFlagUrl.value = responseData['country']['flagUrl'];
      redeemInstruction.value = responseData['redeemInstruction']['verbose'];
      brandName.value = responseData['brand']['brandName'];
    }
  }

  void decrementQuantity() {
    var quantityInt = int.parse(giftcardQuantity.value);
    if (quantityInt > 0) {
      var newQuantity = quantityInt - 1;
      if (kDebugMode) {
        print(newQuantity);
      }
      giftcardQuantity.value = newQuantity.toString();
    }
  }

  void incrementQuantity() {
    var quantityInt = int.parse(giftcardQuantity.value);
    print(quantityInt);
    var giftCardPriceKeyNum = num.parse(giftcardPriceKey.value);

    var priceRangeChecker = quantityInt * giftCardPriceKeyNum;

    if (quantityInt >= 0 && priceRangeChecker < 100) {
      print(giftCardPriceKeyNum);
      print(priceRangeChecker);
      var newQuantity = quantityInt + 1;
      if (kDebugMode) {
        print(newQuantity);
      }
      if (priceRangeChecker <= 100) {
        giftcardQuantity.value = newQuantity.toString();
      }

      if (kDebugMode) {
        print(giftcardQuantity.value);
      }
    }
  }

  void calculateTotalPrice() {
    var unitPrice = num.parse(giftCardPriceValue.value);
    var quantity = num.parse(giftcardQuantity.value);
    initialPrice.value = "";
    if (!unitPrice.isNaN && !quantity.isNaN) {
      final totalPrice = unitPrice * quantity;
      totalPrices.value = totalPrice.toString();

      final giftcardValues = double.tryParse(giftCardPriceValue.value);
      initialPrice.value = valueConverter.format(giftcardValues);
      update();
    }
  }

  void commissionCalculator() {
    if (totalPrices.value.isNotEmpty) {
      var totalPriceNum = num.parse(totalPrices.value);
      var commissionOutput = (totalPriceNum / 100) * 10;
      giftcardCommission.value = commissionOutput.toString();
      var giftcardCommissions = double.tryParse(giftcardCommission.value);
      commissionPrice.value = valueConverter.format(giftcardCommissions);
      update();
    }
  }

  void totalPrice() {
    if (commissionPrice.value.isNotEmpty && initialPrice.value.isNotEmpty) {
      var commissionNum = num.parse(giftcardCommission.value);
      var initialPriceNum = num.parse(totalPrices.value);
      var output = commissionNum + initialPriceNum;
      cummulativeTotalPrice.value = output.toString();

      var cummulativePrice = valueConverter.format(output);
      formattedCTP.value = cummulativePrice;
    }
  }

  void phoneValidator(String newValue) {
    phoneNumberValidated.value = false;
    if (!newValue.isPhoneNumber && newValue.length < 9) {
      return;
    }
    print(newValue);
    recipientphoneNumber.value = newValue;
    phoneNumberValidated.value = true;
  }

  void emailValidator(String newValue) {
    emailValidated.value = false;
    if (newValue.isEmail && newValue.isNotEmpty) {
      print(newValue);

      emailValidated.value = true;
    }
  }

  void countryCodeValidator(String newValue) {
    countryCodeValidated.value = false;
    if (!newValue.isAlphabetOnly && newValue.length > 3 && newValue.isEmpty) {
      return;
    }
    print(newValue);

    countryCodeValidated.value = true;
  }
}
