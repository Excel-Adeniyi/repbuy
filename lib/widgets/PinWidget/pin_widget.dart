import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shapmanpaypoint/controller/otp/otp_controller.dart';

class PinWidget extends StatelessWidget {
  const PinWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final OTPController otpController = Get.put(OTPController());
    return PinCodeTextField(
      appContext: context,
      obscuringCharacter: '*',
      // controller: pinController,
      focusNode: FocusNode(),
      obscureText: true,
      length: 4,
      onCompleted: (value) {
        otpController.checkOTP(value);
      },
      // blinkDuration: const Duration(seconds: 2),
      keyboardType: TextInputType.number,
      blinkWhenObscuring: true,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return '';
        } else if (value.length == 4) {
          print("Complete");
          // print(_otpController.isComplete.value);
        }

        return null; // Return null if validation passes
      },
      pinTheme: PinTheme(
          activeFillColor: Colors.white,
          activeColor: Colors.white,
          selectedColor: Colors.white,
          selectedFillColor: Colors.white,
          inactiveFillColor: Colors.white,
          inactiveColor: Colors.white,
          borderWidth: 0,
          borderRadius: const BorderRadius.all(Radius.circular(29)),
          fieldHeight: 50),
      boxShadows: const [
        BoxShadow(
          offset: Offset(0, 1),
          color: Colors.orange,
          blurRadius: 0,
        )
      ],
      enableActiveFill: true,
    );
  }
}
