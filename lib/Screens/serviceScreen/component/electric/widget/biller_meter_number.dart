import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/utility_controller/utility_controller.dart';

class CustomerMeterNumber extends StatelessWidget {
  final dynamic meterNumberFocus;
  final UtilityController utilityController = Get.find<UtilityController>();
  CustomerMeterNumber({super.key, required this.meterNumberFocus});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Obx(
        () => TextField(
          // controller: fieldcontroller,
          cursorColor: const Color(0xff0a2417),
          focusNode: meterNumberFocus,
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
            focusColor: const Color(0xfffcdc2a),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff0a2417))),
            labelText: 'Enter Meter Number',
            labelStyle: const TextStyle(color: Colors.black45),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff0a2417))),
            focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xfffcdc2a))),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff0a2417))),
          ),
        ),
      ),
    );
  }
}
