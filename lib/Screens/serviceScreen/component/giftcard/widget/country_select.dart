import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Model/ISOData/iso_model.dart';
import 'package:shapmanpaypoint/controller/Iso/iso_controller.dart';
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
          border: Border.all(width: 1.0, color: const Color(0xff0a2417))),
      height: 65,
      width: double.infinity,
      child: Obx(
        () => DropdownSearch<String>(
          popupProps: const PopupProps.menu(
            showSearchBox: true,
          ),
          dropdownDecoratorProps: const DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
            contentPadding: EdgeInsets.all(8.0),
            border: InputBorder.none,
          )),
          items: isoController.isoDetails.map((item) => item.name).toList(),
          onChanged: (String? newValue) {
            // Handle dropdown value change if needed
            final isoData = isoController.isoDetails
                .firstWhere((item) => item.name == newValue);
            isoController.isoName.value = isoData.isoName;
            if (isoController.isoName.value.isNotEmpty) {
              availableCards.cardRequest();
            }
          },
          dropdownBuilder: (context, selectedItem) {
            return Align(
                alignment: Alignment.centerLeft,
                child: Text(selectedItem ?? 'Select Country'));
          },
        ),
      ),
    );
  }
}
