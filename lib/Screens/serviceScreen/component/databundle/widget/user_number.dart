import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shapmanpaypoint/controller/AirtimeTopUp/airtimeController.dart';
import 'package:shapmanpaypoint/controller/contact_picker/contact_picker.dart';
import 'package:shapmanpaypoint/controller/validator/airtime_validator.dart';

import '../../../../../controller/rechargeController.dart';

class UserMobile extends StatelessWidget {
  const UserMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final PhoneController phoneNumberContoller = Get.find<PhoneController>();
    final RechargeController imageSelector = Get.find<RechargeController>();
    final ContactPickerController contactController =
        Get.find<ContactPickerController>();

    return SizedBox(
      height: 100,

      //############TextField#############

      child: Obx(
        () {
          return TextField(
            controller: contactController.phonController.phoneController,
            cursorColor: const Color.fromARGB(255, 21, 74, 117),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            onChanged: (value) => {
              {phoneNumberContoller.phoneNumber.value = value}
            },
            readOnly: imageSelector.selectedButton.value != 'Buy for Self'
                ? false
                : true,
            maxLength: 16,
            decoration: InputDecoration(
              focusColor: Colors.black,
              focusedBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color(0xff0a2417))),
              labelText: 'Phone number',
              labelStyle: const TextStyle(color: Colors.black45),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xfffcdc2a))),
              error: Obx(() {
                final validatorError = phoneNumberContoller.validatePhoneNumber(
                    phoneNumberContoller.phoneNumber.value);
                return validatorError != null &&
                        contactController.phonController.phoneController.text !=
                            ''
                    ? contactController
                                .phonController.phoneController.text.length <
                            10
                        ? Text(validatorError,
                            style: const TextStyle(color: Colors.red))
                        : const Text('')
                    : const Text('');
              }),
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color(0xff0a2417))),
              errorBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color(0xff0a2417))),
              suffixIcon: GestureDetector(
                onTap: () async {
                  if (imageSelector.selectedButton.value != 'Buy for Self') {
                    await contactController.pickContacts();
                  }
                },
                child: const Icon(
                  Icons.contact_phone_sharp,
                  color: Color(0xff0a2417),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
