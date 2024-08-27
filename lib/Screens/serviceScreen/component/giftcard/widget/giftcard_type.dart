import 'package:dropdown_search/dropdown_search.dart';
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
        () => DropdownSearch<String>(
          popupProps: const PopupProps.menu(
            showSearchBox: true,
          ),
          items: giftcardController.giftcardList.entries
              .map((entry) => entry.value.toString())
              .toList(),
          onChanged: (String? newValue) {
            final giftValue = giftcardController.giftcardList.entries
                .firstWhere((value) => value.value == newValue);
            print("GIFTVALUE $giftValue");
            giftcardController.giftcardValue.value = giftValue.key.toString();
            if (giftcardController.giftcardValue.value.isNotEmpty) {
              giftbyId.giftcardidRequest();
            }
          },
          dropdownBuilder: (context, selectedItem) {
            return Align(
                alignment: Alignment.centerLeft,
                child: Text(selectedItem ?? 'Select type'));
          },
        ),
      ),
    );
  }
}
