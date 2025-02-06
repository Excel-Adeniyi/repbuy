import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/giftcard/widget/giftcard_type.dart';
import 'package:shapmanpaypoint/controller/Iso/iso_controller.dart';
import 'package:shapmanpaypoint/services/GiftCard/gift_card_service.dart';

import '../../../../../controller/GiftCard/gift_card_controller.dart';

class CountrySelector extends StatelessWidget {
  const CountrySelector({super.key});

  @override
  Widget build(BuildContext context) {
    final IsoController isoController = Get.put(IsoController());
    final GiftCardController giftCardController =
        Get.find<GiftCardController>();
    print(
        'HERE ARE THE RESULTS ${isoController.isoName.value}  ${giftCardController.giftcardValue.value}');
    final availableCards = GiftCardService();
    return Obx(
      () => Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          const Align(alignment: Alignment.bottomLeft, child: Text('Country')),
          const SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Kindly select your preferred gift card country',
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
              () => DropdownSearch<String>(
                popupProps: const PopupProps.menu(
                  showSearchBox: true,
                ),
                dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8.0),
                  border: InputBorder.none,
                )),
                items:
                    isoController.isoDetails.map((item) => item.name).toList(),
                onChanged: (String? newValue) {
                  // Handle dropdown value change if needed
                  final isoData = isoController.isoDetails
                      .firstWhere((item) => item.name == newValue);
                  isoController.isoName.value = isoData.isoName;
                  if (isoController.isoName.value.isNotEmpty) {
                    // print('I GOT HERE COUNTRY SELECT');
                    giftCardController.giftCardListLoading.value = true;
                    availableCards.cardRequest();
                  }
                },
                dropdownBuilder: (context, selectedItem) {
                  return Align(
                      alignment: Alignment.centerLeft,
                      child: Text(selectedItem ?? 'Select Country'));
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Align(
              alignment: Alignment.bottomLeft, child: Text('Card Type')),
          const SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Choose a card type',
              style: TextStyle(
                  fontSize: 10,
                  fontStyle: FontStyle.italic,
                  color: Colors.lightGreen[900]),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const GiftCardType(),
          const SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              TextButton(
                onPressed: (() => {
                      giftCardController.currentStep.value =
                          giftCardController.currentStep.value + 1
                    }),
                child: Container(
                  width: double.infinity,
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
              (isoController.isoName.value == 'Select Country' ||
                      giftCardController.giftcardValue.value == '0')
                  ? TextButton(
                      onPressed: (() => {}),
                      child: Container(
                        width: double.infinity,
                        height: 45.0,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18.0)),
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
                  : const SizedBox.shrink(),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
