import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/electric/widget/biller_amount.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/electric/widget/biller_meter_number.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/electric/widget/biller_name.dart';
import 'package:shapmanpaypoint/controller/utility_controller/utility_controller.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';
import 'package:shapmanpaypoint/widgets/balanceTopup/balanceTop.dart';
import 'package:shapmanpaypoint/controller/electricController.dart';

import 'package:shapmanpaypoint/widgets/button/newbutton.dart';

class Electric extends StatelessWidget {
  final ElectricController imageSelector = Get.put(ElectricController());
  final UtilityController utilityController = Get.put(UtilityController());

  Electric({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = 'Electric Bills';
    Size screenSize = MediaQuery.sizeOf(context);
    // double screenWidth = MediaQuery.of(context).size.width;
    FocusNode meterNumberFocus = FocusNode();
    FocusNode amountFocus = FocusNode();
    // double containerWidth;
    // if (screenWidth < 600) {
    //   containerWidth = 300.0;
    // } else if (screenWidth < 1200) {
    //   containerWidth = 400.0;
    // } else {
    //   containerWidth = 500.0;
    // }
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () {
          meterNumberFocus.unfocus();
          amountFocus.unfocus();
        },
        child: SingleChildScrollView(
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
                  const BillerName(),
                  const SizedBox(height: 38),
                  CustomerMeterNumber(meterNumberFocus: meterNumberFocus),
                  const SizedBox(
                    height: 2,
                  ),
                  BillerAmount(amountFocus: amountFocus),
                  const UniversalButton(
                      route: "/utilityreview",
                      buttonText: "Continue",
                      withIcon: "no"),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getImageWidgets() {
    return imageSelector.images.map((image) {
      // final isSelectedObservable = image.isSelected.obs;
      return GestureDetector(
        onTap: () {
          imageSelector.selectImage(image.value);
          // print(image.value);
        },
        child: GetBuilder<ElectricController>(
          builder: (controller) {
            return Container(
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                      color: controller.isImageSelected(image.value)
                          ? Colors.purple
                          : Colors.grey,
                      width:
                          controller.isImageSelected(image.value) ? 2 : 0.2)),
              child: Image.asset(
                image.value,
                width: 50,
                height: 30,
              ),
            );
          },
        ),
      );
    }).toList();
  }
}
