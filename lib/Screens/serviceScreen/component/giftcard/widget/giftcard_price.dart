import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/GiftCard/gift_card_controller.dart';

class GiftCardPrice extends StatelessWidget {
  const GiftCardPrice({super.key});

  @override
  Widget build(BuildContext context) {
    GiftCardController giftcardController = Get.put(GiftCardController());
    return Container(
      // margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
              width: 1.0, color: const Color(0xff0a2417))),
      height: 65,
      width: double.infinity,
      child: Obx(
        () => DropdownButton<String>(
          padding: const EdgeInsets.all(8.0),
          isExpanded: true,
          underline: const SizedBox.shrink(),
          value: giftcardController.giftcardPriceKey.value,
          icon: const Icon(Icons.keyboard_arrow_down),
          style: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black),
          items: [
            const DropdownMenuItem<String>(
              value: "0.00",
              child: Text("Select A GiftCard"),
            ),
            ...giftcardController.fixedRecipientToSenderDenominationsMap.entries
                .map<DropdownMenuItem<String>>((entry) {
              // Gcard item = entry.key;
              return DropdownMenuItem<String>(
                value: entry.key.toString(),
                child: Text(
                    '${giftcardController.senderCurrencyCode.value} ${entry.value.toString()}'),
              );
            }),
          ],
          onChanged: (String? newValue) {
            // Handle dropdown value change if needed

            giftcardController.giftcardPriceKey.value = newValue as String;
            if (giftcardController.giftcardPriceKey.value.isNotEmpty) {
              final dynamic priceKey = giftcardController
                  .fixedRecipientToSenderDenominationsMap.entries
                  .firstWhere((entry) {
                double valuedouble = double.parse(newValue);

                double entrydouble = (entry.key is String)
                    ? double.parse(entry.key)
                    : (entry.value is int)
                        ? entry.value.toDouble()
                        : entry.value;
                return entrydouble == valuedouble;
              }).value;
              if (priceKey != null) {
                giftcardController.giftcardQuantity.value = "0";
                giftcardController.giftCardPriceValue.value =
                    priceKey.toString();
              }
            }
          },
        ),
      ),
    );
  }
}
