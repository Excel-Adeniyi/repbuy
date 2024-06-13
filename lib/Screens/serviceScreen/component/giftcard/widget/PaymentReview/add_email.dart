import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Model/ISOData/iso_model.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/giftcard/widget/payment_method.dart';
import 'package:shapmanpaypoint/controller/Effects/on_tap.dart';
import 'package:shapmanpaypoint/controller/GiftCard/gift_card_controller.dart';
import 'package:shapmanpaypoint/controller/Iso/isoController.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';
import 'package:shapmanpaypoint/utils/responsiveness/buttonWidth.dart';

class EmailAddress extends StatelessWidget {
  const EmailAddress({super.key});
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);
    GiftCardController giftCardController = Get.find<GiftCardController>();
    final IsoController isoController = Get.put(IsoController());
    final ontapEffectController = Get.put(OnTapEffect());
    final FocusNode focusnode = FocusNode();
    final FocusNode phoneFocuse = FocusNode();
    return GestureDetector(
      onTap: () {
        focusnode.unfocus();
        phoneFocuse.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(
          () => Center(
            child: SizedBox(
              width: screenSize.width * 0.9,
              child: Column(
                children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                              colors: buttongradient,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight)
                          .createShader(bounds);
                    },
                    child: const Text(
                      "Recipient Details",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    autocorrect: true,
                    focusNode: focusnode,
                    // controller: phoneNumber,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        label: Text("Recipient Email Address"),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xfffcdc2a), width: 0.8))),
                    onChanged: (String newValue) {
                      if (newValue.isNotEmpty) {
                        giftCardController.recipientemaill.value = newValue;
                        giftCardController.emailValidator(newValue);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    autocorrect: true,
                    focusNode: phoneFocuse,
                    readOnly: giftCardController.countryCodeValidated.isTrue
                        ? false
                        : true,
                    // controller: emailAdd,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.phone,

                    decoration: InputDecoration(
                        prefixIcon: Obx(
                          () => DropdownButton<String>(
                            focusColor: const Color(0xfffcdc2a),
                            padding: const EdgeInsets.all(8.0),
                            isExpanded: false,
                            underline: const SizedBox.shrink(),
                            value:
                                giftCardController.recipientCountryCode.value,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.black),
                            items: [
                              const DropdownMenuItem<String>(
                                value: "",
                                child: Text("+#"),
                              ),
                              ...isoController.isoDetails
                                  .map<DropdownMenuItem<String>>((Iso item) {
                                return DropdownMenuItem<String>(
                                  value: item.isoName,
                                  child: SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.15,
                                    child: Text(
                                        "${item.isoName} ${item.callingCodes}"),
                                  ),
                                );
                              }).toList(),
                            ],
                            onChanged: (dynamic newValue) {
                              // Handle dropdown value change if needed
                              if (newValue != null) {
                                giftCardController.recipientCountryCode.value =
                                    newValue;

                                giftCardController
                                    .countryCodeValidator(newValue);
                              }
                            },
                          ),
                        ),
                        label: const Text("Recipient Phone Number"),
                        border: const OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xfffcdc2a), width: 0.8))),
                    onChanged: (String newValue) {
                      if (newValue.isNotEmpty) {
                        giftCardController.recipientphoneNumber.value =
                            newValue;
                        // print(giftCardController.recipientphoneNumber.value);
                        giftCardController.phoneValidator(newValue);
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  AnimatedOpacity(
                    opacity: giftCardController.countryCodeValidated.isTrue &&
                            giftCardController.phoneNumberValidated.isTrue &&
                            giftCardController.emailValidated.isTrue
                        ? 1.0
                        : 0.5,
                    duration: const Duration(microseconds: 3000),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      // margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                      height: 50,
                      width: calculateButtonWidth(context),
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45, // Shadow color
                              blurRadius: 5.0, // Blur radius
                              offset: Offset(0, 2),
                            )
                          ],
                          border: Border.all(
                              color: const Color.fromARGB(255, 219, 218, 218),
                              width: 1.0),
                          gradient: LinearGradient(
                              colors: ontapEffectController.isTapped.value
                                  ? isbuttongradient
                                  : buttongradient,
                              begin: Alignment.bottomRight,
                              end: Alignment.topCenter),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                        onPressed: () {
                          if (giftCardController.countryCodeValidated.isTrue &&
                              giftCardController.phoneNumberValidated.isTrue &&
                              giftCardController.emailValidated.isTrue) {
                            ontapEffectController.isTapped.value = true;
                            Future.delayed(const Duration(milliseconds: 1000),
                                () {
                              ontapEffectController.isTapped.value = false;
                              ontapEffectController.isBSopen.value = false;

                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) =>
                                    const GiftCardSelectPaymentMethod(
                                        title: "GiftCard Purchase"),
                              );
                            });
                          }
                        },
                        child: ontapEffectController.isTapped.value == true
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                'Continue',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
