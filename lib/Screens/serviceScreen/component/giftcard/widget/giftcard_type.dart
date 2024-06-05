import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/GiftCard/gift_card_controller.dart';
import 'package:shapmanpaypoint/services/GiftCard/get_giftcard_by_id.dart';

class GiftCardType extends StatelessWidget {
  const GiftCardType({super.key});

  @override
  Widget build(BuildContext context) {
    GiftCardController giftcardController = Get.put(GiftCardController());
    final giftbyId = GiftCardByIDService();
    return Container(
      // margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
              width: 1.0, color: const Color.fromARGB(255, 73, 22, 105))),
      height: 65,
      width: double.infinity,
      child: Obx(
        () => DropdownButton<String>(
          padding: const EdgeInsets.all(8.0),
          isExpanded: true,
          underline: const SizedBox.shrink(),
          value: giftcardController.giftcardValue.value,
          icon: const Icon(Icons.keyboard_arrow_down),
          style: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black),
          items: [
            const DropdownMenuItem<String>(
              value: "0",
              child: Text("Select A GiftCard"),
            ),
            ...giftcardController.giftcardList.entries
                .map<DropdownMenuItem<String>>((entry) {
              // Gcard item = entry.key;
              return DropdownMenuItem<String>(
                value: entry.key.toString(),
                child: Text(entry.value),
              );
            }).toList(),
          ],
          onChanged: (String? newValue) {
            // Handle dropdown value change if needed
            // print(newValue);
            giftcardController.giftcardValue.value = newValue as String;
            
        
           
            if (giftcardController.giftcardValue.value.isNotEmpty) {
              // availableCards.cardRequest();
              giftbyId.giftcardidRequest();
            }
          },
        ),
      ),
    );
  }
}
