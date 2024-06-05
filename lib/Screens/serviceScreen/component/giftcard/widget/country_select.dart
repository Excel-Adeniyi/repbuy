import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Model/ISOData/iso_model.dart';
import 'package:shapmanpaypoint/controller/Iso/isoController.dart';
import 'package:shapmanpaypoint/services/GiftCard/gift_card_service.dart';

class CountrySelector extends StatelessWidget {
  const CountrySelector({super.key});

  @override
  Widget build(BuildContext context) {
    final IsoController isoController = Get.put(IsoController());
    final availableCards = GiftCardService();
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
          value: isoController.isoName.value,
          icon: const Icon(Icons.keyboard_arrow_down),
          style: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black),
          items: [
            const DropdownMenuItem<String>(
              value: "Select Country",
              child: Text("Select Country"),
            ),
            ...isoController.isoDetails
                .map<DropdownMenuItem<String>>((Iso item) {
              return DropdownMenuItem<String>(
                value: item.isoName ?? "Unknown",
                child: Text(item.name ?? "Unknown"),
              );
            }).toList(),
          ],
          onChanged: (String? newValue) {
            // Handle dropdown value change if needed
            isoController.isoName.value = newValue as String;
            if (isoController.isoName.value.isNotEmpty) {
              availableCards.cardRequest();
            }
          },
        ),
      ),
    );
  }
}
