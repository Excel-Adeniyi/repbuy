// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/giftcard/widget/country_select.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/giftcard/widget/giftcard_price.dart';
import 'package:shapmanpaypoint/controller/GiftCard/gift_card_controller.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';
import 'package:shapmanpaypoint/widgets/balanceTopup/balanceTop.dart';
import 'package:shapmanpaypoint/widgets/button/newbutton.dart';

class GiftCard extends StatelessWidget {
  final GiftCardController giftCardController = Get.put(GiftCardController());
  var unescape = HtmlUnescape();
  GiftCard({super.key});

  @override
  Widget build(BuildContext context) {
    String title = 'Gift Cards';
    Size screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        String redeemInstruction = giftCardController.redeemInstruction.value;

        String normalString = unescape.convert(redeemInstruction);
        // List of step contents
        List<Widget> stepContents = [
          const CountrySelector(), // Step 0
          // Step 1
          const GiftCardPrice(), // Step 2
// Step 3
          Column(
            // Step 4
            children: [
              const SizedBox(
                height: 5,
              ),
              const Align(
                  alignment: Alignment.bottomLeft, child: Text('Instructions')),
              const SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Redeem Instructions',
                  style: TextStyle(
                      fontSize: 10,
                      fontStyle: FontStyle.italic,
                      color: Colors.lightGreen[900]),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(normalString),
              const SizedBox(height: 10),
              const UniversalButton(
                route: "/giftcardpaymentreview",
                buttonText: "Continue",
                withIcon: "no",
              ),
            ],
          ),
        ];
        List<EasyStep> steppers = [
          const EasyStep(
            // customTitle:
            //     const Text('Kindly select your preferred gift card country'),
            customStep: Text('1'),
          ),
          const EasyStep(
            customStep: Text('2'),
          ),
          const EasyStep(
            customStep: Text('3'),
          )
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
                  Obx(
                    () => EasyStepper(
                      // type: StepperType.horizontal,
                      activeStep: giftCardController.currentStep.value,
                      stepRadius: 25,

                      finishedStepTextColor: Colors.white,
                      finishedStepBackgroundColor: Colors.lightGreen[700],
                      finishedStepIconColor: Colors.white,
                      steps: steppers, // Use the `steppers` list
                      // Adjust the length of lines between steps
                      stepShape: StepShape.circle, // Customize the shape
                      // Customize the border
                    ),
                  ),
                  const SizedBox(height: 5),
                  IndexedStack(
                    index: giftCardController.currentStep.value,
                    children: stepContents,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
