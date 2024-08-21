// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/giftcard/widget/country_select.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/giftcard/widget/giftcard_price.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/giftcard/widget/giftcard_quantity.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/giftcard/widget/giftcard_type.dart';
import 'package:shapmanpaypoint/controller/GiftCard/gift_card_controller.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';
import 'package:shapmanpaypoint/widgets/balanceTopup/balanceTop.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:shapmanpaypoint/widgets/button/newbutton.dart';

class GiftCard extends StatelessWidget {
  final GiftCardController giftCardController = Get.put(GiftCardController());
  var unescape = HtmlUnescape();
  GiftCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = 'Gift Cards';
    Size screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        String redeemInstruction = giftCardController.redeemInstruction.value;

        String normalString = unescape.convert(redeemInstruction);
        List<Step> steppers = [
          Step(
              title: const Text("Country", style: TextStyle()),
              subtitle:
                  const Text('Kindly select your preferred gift card country'),
              content: const CountrySelector(),
              isActive: giftCardController.currentStep.value == 0),
          Step(
              title: const Text("Card Type", style: TextStyle()),
              subtitle: const Text('Choose a card type'),
              // content: CustomerMeterNumber(),
              content: const GiftCardType(),
              isActive: giftCardController.currentStep.value == 1),
          Step(
              title: const Text("Amount(Price)", style: TextStyle()),
              subtitle: const Text('Choose an Amount of GiftCard '),
              content: const GiftCardPrice(),
              isActive: giftCardController.currentStep.value == 2),
          Step(
              title: const Text("Quantity", style: TextStyle()),
              subtitle: const Text('Choose Quantity'),
              content: GiftCardQuantity(),
              isActive: giftCardController.currentStep.value == 3),
          Step(
              title: const Text("Completed", style: TextStyle()),
              subtitle: const Text('Redeem Instructions'),
              content: Column(
                children: [
                  Text(normalString),
                  const SizedBox(height: 10),
                  const UniversalButton(
                      route: "/giftcardpaymentreview",
                      buttonText: "Continue",
                      withIcon: "no"),
                ],
              ),
              isActive: giftCardController.currentStep.value == 4),
        ];
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: SizedBox(
              width: screenSize.width * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                              colors: buttongradient,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight)
                          .createShader(bounds);
                    },
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  TopBalance(),
                  const SizedBox(height: 30),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 100,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: giftCardController.cardImages.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              // width: ,
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                  color: const Color(0xff0a2417),
                                  borderRadius: BorderRadius.circular(8.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.yellow.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ]),
                              child: FadeInImage.assetNetwork(
                                placeholder: 'lib/assets/logo.png',
                                image: i,
                                width: MediaQuery.of(context).size.width,
                                height: 400,
                              ));
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 30),
                  giftCardController.currentStep.value == 0
                      ? Obx(
                          () => Stepper(
                            currentStep: giftCardController.currentStep.value,
                            onStepContinue: () {
                              if (giftCardController.currentStep.value <
                                  steppers.length - 1) {
                                giftCardController.currentStep.value++;
                              } else {
                                null;
                              }
                            },
                            steps: steppers,
                          ),
                        )
                      : giftCardController.currentStep.value == 4
                          ? Obx(
                              () => Stepper(
                                currentStep:
                                    giftCardController.currentStep.value,
                                onStepCancel: () {
                                  if (giftCardController.currentStep.value >
                                          0 &&
                                      giftCardController.currentStep.value !=
                                          0) {
                                    giftCardController.currentStep.value--;
                                  } else {
                                    null;
                                  }
                                },
                                steps: steppers,
                              ),
                            )
                          : Obx(
                              () => Stepper(
                                currentStep:
                                    giftCardController.currentStep.value,
                                onStepContinue: () {
                                  if (giftCardController.currentStep.value <
                                      steppers.length - 1) {
                                    giftCardController.currentStep.value++;
                                  } else {
                                    null;
                                  }
                                },
                                onStepCancel: () {
                                  if (giftCardController.currentStep.value >
                                          0 &&
                                      giftCardController.currentStep.value !=
                                          0) {
                                    giftCardController.currentStep.value--;
                                  } else {
                                    null;
                                  }
                                },
                                steps: steppers,
                              ),
                            ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
