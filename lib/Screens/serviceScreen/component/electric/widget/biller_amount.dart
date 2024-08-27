import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/utility_controller/utility_controller.dart';

class BillerAmount extends StatelessWidget {
  final UtilityController utilityController = Get.find<UtilityController>();
  final dynamic amountFocus;
  BillerAmount({super.key, required this.amountFocus});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Obx(
        () => TextField(
          cursorColor: const Color(0xff0a2417),
          cursorErrorColor: Colors.red,
          // controller: utilityController.valuers,
          keyboardType: TextInputType.number,
          focusNode: amountFocus,
          style: const TextStyle(),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff0a2417)),
            ),
            labelStyle: const TextStyle(color: Colors.black45),
            errorBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color(0xff0a2417))),
            labelText: 'Enter Amount',
            focusColor: const Color(0xff0a2417),
            error: utilityController.showError(),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff0a2417))),
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
