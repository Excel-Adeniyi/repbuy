// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/utility_controller/utility_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';

class BillerName extends StatelessWidget {
  const BillerName({super.key});

  @override
  Widget build(BuildContext context) {
    final UtilityController utilityController = Get.find<UtilityController>();
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              width: 1.0, color: const Color.fromARGB(255, 73, 22, 105)),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      height: 65,
      width: double.infinity,
      child: Obx(() {
        return DropdownSearch(
          popupProps: const PopupProps.menu(
            showSearchBox: true,
          ),

          items: utilityController.utilityPlan
              .map<String>((item) => item.name)
              .toList(),
          dropdownDecoratorProps: const DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
            contentPadding: EdgeInsets.all(8.0),
            border: InputBorder.none,
          )),

          onChanged: (dynamic selectedvalue) {
            // print(utilityController.utilityPlan);
            utilityController.utilityProvider.value = selectedvalue;
            final selectedPackage = utilityController.utilityPlan
                .firstWhere((data) => data.name == selectedvalue);
            final contentVideo = selectedPackage.id.toString();
            // print(contentVideo);
            utilityController.handleSelectedPackage(contentVideo);
            utilityController.splicer();
          },
          dropdownBuilder: (context, selectedItem) {
            return Align(
                alignment: Alignment.centerLeft,
                child: Text(selectedItem ?? 'Select biller'));
          },
        );
      }),
    );
  }
}
