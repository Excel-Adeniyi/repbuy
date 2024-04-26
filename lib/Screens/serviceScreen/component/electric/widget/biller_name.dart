import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/utility_controller/utility_controller.dart';

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
        return DropdownButton(
            elevation: 0,
            underline: const SizedBox(),
            padding: const EdgeInsets.all(8.0),
            isExpanded: true,
            value: utilityController.utilityPackage.value,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: [
              const DropdownMenuItem(
                  value: "Select Service", child: Text("Select Biller")),
              ...utilityController.utilityPlan
                  .map<DropdownMenuItem<String>>((item) => DropdownMenuItem(
                      value: item.id.toString(), child: Text(item.name)))
                  .toSet()
                  .toList(),
            ],
            onChanged: (dynamic selectedvalue) {
              print(utilityController.utilityPlan);
              utilityController.handleSelectedPackage(selectedvalue);
              utilityController.splicer();
            });
      }),
    );
  }
}
