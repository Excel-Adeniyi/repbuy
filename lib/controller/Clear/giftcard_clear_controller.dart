import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/GiftCard/gift_card_controller.dart';
import 'package:shapmanpaypoint/controller/Iso/isoController.dart';

class GiftCardClearer extends GetxController {
  final giftcardController = Get.find<GiftCardController>();
  final isoName = Get.find<IsoController>();
  void clearForm() {
    isoName.selectedCountry.value = "Select Country";
    isoName.isoName.value = "Select Country";
    giftcardController.currentStep.value = 0;
    giftcardController.giftcardList.value = <dynamic, String>{};
    giftcardController.giftcardValue.value = '0';
    giftcardController.giftcardPriceKey.value = '0.00';
    giftcardController.giftCardPriceValue.value = '0';
    giftcardController.giftcardQuantity.value = '0';
    giftcardController.giftcardCommission.value = "";
    giftcardController.totalPrices.value = "";
    giftcardController.commissionPrice.value = "";
    giftcardController.initialPrice.value = "";
    giftcardController.steppers.value = <Step>[];
    giftcardController.cummulativeTotalPrice.value = "";
    giftcardController.formattedCTP.value = "";
    giftcardController.recipientphoneNumber.value = "";
    giftcardController.recipientemaill.value = "";
    giftcardController.recipientCountryCode.value = "";
    giftcardController.phoneNumberValidated.value = false;
    giftcardController.emailValidated.value = false;
    giftcardController.countryCodeValidated.value = false;

    //##### RESUlt GOTTEN FROM THE ID ######
    giftcardController.productName.value = '';
    giftcardController.fixedRecipientToSenderDenominationsMap.value = {};
    giftcardController.senderFee.value = '';
    giftcardController.logoUrls.value = '';
    giftcardController.countryFlagUrl.value = '';
    giftcardController.redeemInstruction.value = '';
    giftcardController.brandName.value = '';
    giftcardController.senderCurrencyCode.value = '';
    giftcardController.productId.value = 0;
  }
}
