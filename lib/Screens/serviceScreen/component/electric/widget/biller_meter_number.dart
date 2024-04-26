import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/utility_controller/utility_controller.dart';

class CustomerMeterNumber extends StatelessWidget {
  final UtilityController utilityController = Get.find<UtilityController>();
  CustomerMeterNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 100,
        child: TextField(
          decoration: InputDecoration(
            labelText: 'Enter Meter Number',
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 73, 22, 105)),
            ),
            labelStyle: const TextStyle(color: Colors.grey),
            errorBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 73, 22, 105))),
            error: utilityController.meterError(),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple)),
          ),
          onChanged: (String meterValue) {
            utilityController.meterValidator(meterValue);
          },
        ),
      ),
    );
  }
}
