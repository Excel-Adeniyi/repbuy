import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/utility_controller/utility_controller.dart';

class CustomerMeterNumber extends StatelessWidget {
  final UtilityController utilityController = Get.find<UtilityController>();
  CustomerMeterNumber({super.key});

  @override
  Widget build(BuildContext context) {
  
    return SizedBox(
      height: 100,
      child: Obx(
        () => TextField(
          // controller: fieldcontroller,
          cursorColor: const Color.fromARGB(255, 21, 74, 117),
          onChanged: (value) {
            utilityController.billerMeter.value = value;
          },
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            error: () {
              utilityController
                  .meterValidator(utilityController.billerMeter.value);

              return utilityController.isMeterComplete.isTrue
                  ? utilityController.meterError()
                  : const Text('');
            }(),
            focusColor: Colors.black,
            focusedBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 73, 22, 105))),
            // labelText: 'Enter Amount',
            // labelStyle: const TextStyle(color: Colors.grey),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue)),
            focusedErrorBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 73, 22, 105))),
            errorBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 73, 22, 105))),
                  
          ),
          
        ),
      ),
    );
  }
}
