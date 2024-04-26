import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/utility_controller/utility_controller.dart';

class BillerAmount extends StatelessWidget {
  final UtilityController utilityController = Get.find<UtilityController>();
  BillerAmount({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Obx(
        () => TextField(
          cursorColor: Colors.purple,
          cursorErrorColor: Colors.grey,
          // controller: utilityController.valuers,
          keyboardType: TextInputType.number,
          style: const TextStyle(),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 73, 22, 105)),
            ),
            labelStyle: const TextStyle(color: Colors.grey),
            errorBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 73, 22, 105))),
            labelText: 'Enter Amount',
            error: utilityController.showError(),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple)),
          ),
          onChanged: (dynamic amountValue) {
            utilityController.amountValidator(amountValue);
            utilityController.purchaseSum();
          },
        ),
      ),
    );
  }
}
