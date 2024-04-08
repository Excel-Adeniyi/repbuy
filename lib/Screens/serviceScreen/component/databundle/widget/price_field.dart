import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/DataBundle/data_bundle.dart';
import 'package:shapmanpaypoint/controller/validator/airtime_validator.dart';

class PriceField extends StatelessWidget {
  const PriceField({super.key});

  @override
  Widget build(BuildContext context) {
    final DataBundleController databundleController =
        Get.find<DataBundleController>();
    final PhoneController phoneNumberContoller = Get.put(PhoneController());
    return SizedBox(
      height: 100,
      child: Obx(
        () => TextField(
          controller: databundleController.priceController,
          cursorColor: const Color.fromARGB(255, 21, 74, 117),
          onChanged: (value) {
            phoneNumberContoller.amountField.value = value;
          },
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            error: () {
              final validatorError = phoneNumberContoller
                  .validateAmountField(phoneNumberContoller.amountField.value);
              return validatorError != null
                  ? Text(
                      validatorError,
                      style: const TextStyle(color: Colors.red),
                    )
                  : const Text('');
            }(),
            focusColor: Colors.black,
            focusedBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 73, 22, 105))),
            labelText: 'Enter Amount',
            labelStyle: const TextStyle(color: Colors.grey),
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
