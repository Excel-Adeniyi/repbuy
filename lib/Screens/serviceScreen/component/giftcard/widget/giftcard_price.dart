import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/giftcard/widget/giftcard_quantity.dart';
import 'package:shapmanpaypoint/controller/GiftCard/gift_card_controller.dart';

class GiftCardPrice extends StatelessWidget {
  const GiftCardPrice({super.key});

  @override
  Widget build(BuildContext context) {
    GiftCardController giftcardController = Get.put(GiftCardController());
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        const Align(
            alignment: Alignment.bottomLeft, child: Text('Amount(Price)')),
        const SizedBox(
          height: 5,
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Choose an Amount of GiftCard ',
            style: TextStyle(
                fontSize: 10,
                fontStyle: FontStyle.italic,
                color: Colors.lightGreen[900]),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          // margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              border: Border.all(width: 1.0, color: const Color(0xff0a2417))),
          height: 65,
          width: double.infinity,
          child: Obx(
            () => DropdownButton<String>(
              padding: const EdgeInsets.all(8.0),
              isExpanded: true,
              underline: const SizedBox.shrink(),
              value: giftcardController.giftcardPriceKey.value,
              icon: const Icon(Icons.keyboard_arrow_down),
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.black),
              items: [
                const DropdownMenuItem<String>(
                  value: "0.00",
                  child: Text("Select A GiftCard"),
                ),
                ...giftcardController
                    .fixedRecipientToSenderDenominationsMap.entries
                    .map<DropdownMenuItem<String>>((entry) {
                  // Gcard item = entry.key;
                  return DropdownMenuItem<String>(
                    value: entry.key.toString(),
                    child: Text(
                        '${giftcardController.senderCurrencyCode.value} ${entry.value.toString()}'),
                  );
                }),
              ],
              onChanged: (String? newValue) {
                // Handle dropdown value change if needed

                giftcardController.giftcardPriceKey.value = newValue as String;
                if (giftcardController.giftcardPriceKey.value.isNotEmpty) {
                  final dynamic priceKey = giftcardController
                      .fixedRecipientToSenderDenominationsMap.entries
                      .firstWhere((entry) {
                    double valuedouble = double.parse(newValue);

                    double entrydouble = (entry.key is String)
                        ? double.parse(entry.key)
                        : (entry.value is int)
                            ? entry.value.toDouble()
                            : entry.value;
                    return entrydouble == valuedouble;
                  }).value;
                  if (priceKey != null) {
                    giftcardController.giftcardQuantity.value = "0";
                    giftcardController.giftCardPriceValue.value =
                        priceKey.toString();
                  }
                }
              },
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Align(alignment: Alignment.bottomLeft, child: Text('Quantity')),
        const SizedBox(
          height: 5,
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Choose Quantity',
            style: TextStyle(
                fontSize: 10,
                fontStyle: FontStyle.italic,
                color: Colors.lightGreen[900]),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        GiftCardQuantity(),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Flexible(
              child: TextButton(
                onPressed: (() => {
                      giftcardController.currentStep.value =
                          giftcardController.currentStep.value - 1
                    }),
                child: Container(
                  // width: double.infinity,
                  height: 45.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0x9E838383)),
                    borderRadius: const BorderRadius.all(Radius.circular(18.0)),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xfffbfbfb),
                        Color(0xfffbfbfb),
                        Color(0xffbab8b8),
                        Color(0xff858484),
                        Color.fromARGB(255, 67, 69, 68),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      transform: GradientRotation(120),
                    ),
                  ),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Back',
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => Flexible(
                child: Stack(
                  children: [
                    TextButton(
                      onPressed: (() => {
                            giftcardController.currentStep.value =
                                giftcardController.currentStep.value + 1
                          }),
                      child: Container(
                        // width: double.infinity,
                        height: 45.0,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18.0)),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xfff7f6bb),
                              Color(0xfffcdc2a),
                              Color(0xff87a922),
                              Color(0xff0a2417),
                              Color.fromARGB(255, 13, 71, 42),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            transform: GradientRotation(120),
                          ),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Next',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    giftcardController.giftcardPriceKey.value == '0.00' ||
                            giftcardController.giftcardQuantity.value == '0'
                        ? TextButton(
                            onPressed: (() => {}),
                            child: Container(
                              // width: double.infinity,
                              height: 45.0,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18.0)),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0x6fededed),
                                    Color(0x5ef3f2ed),
                                    Color(0x71ebece8),
                                    Color(0xff0a2417),
                                    Color.fromARGB(105, 225, 228, 227),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  transform: GradientRotation(120),
                                ),
                              ),
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Next',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
