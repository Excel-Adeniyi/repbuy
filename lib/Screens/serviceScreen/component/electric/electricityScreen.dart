import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/electric/widget/biller_amount.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/electric/widget/biller_meter_number.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/electric/widget/biller_name.dart';
import 'package:shapmanpaypoint/controller/utility_controller/utility_controller.dart';
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
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth;
    if (screenWidth < 600) {
      containerWidth = 300.0;
    } else if (screenWidth < 1200) {
      containerWidth = 400.0;
    } else {
      containerWidth = 500.0;
    }
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: screenSize.width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(colors: [
                      Color(0xFF5423bb),
                      Color(0xFF8629b1),
                      Color(0xFFa12cab),
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
                        .createShader(bounds);
                  },
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                TopBalance(),
                const SizedBox(height: 30),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Biller", style: TextStyle()),
                  ],
                ),
                const BillerName(),
                const SizedBox(height: 30),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Meter number", style: TextStyle()),
                  ],
                ),
                CustomerMeterNumber(),
                const SizedBox(
                  height: 2,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Amount(Price)", style: TextStyle()),
                  ],
                ),
                BillerAmount(),
                const UniversalButton(
                    route: "/utilityreview",
                    buttonText: "Continue",
                    withIcon: "no"),
              ],
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
          print(image.value);
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
