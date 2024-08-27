import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Screens/funding/add_fund_with_card/add_fund_with_card.dart';
import 'package:shapmanpaypoint/utils/responsiveness/buttonWidth.dart';

class GradientButton extends StatelessWidget {
  final String imagedata;
  final String assetName;
  final String pageRoute;
  const GradientButton(
      {super.key,
      required this.imagedata,
      required this.assetName,
      required this.pageRoute});

  @override
  Widget build(BuildContext context) {
    final contentWidth = calculateButtonWidth(context);

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: pageRoute.isEmpty
          ? Container(
              padding: const EdgeInsets.all(10.0),
              width: contentWidth,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Image.asset(
                    imagedata,
                    width: 50,
                    color: const Color(0xff0a2417).withOpacity(0.9),
                    colorBlendMode: BlendMode.modulate,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    assetName,
                    style: const TextStyle(fontSize: 17, color: Colors.black),
                  )
                ],
              ),
            )
          : Container(
              width: contentWidth,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                  onPressed: () {
                    if (pageRoute == "paystack") {
                      Get.to(const AddFundsWithCard());
                    } else {
                      Get.toNamed(pageRoute);
                    }
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        imagedata,
                        width: 50,
                        color: const Color(0xff0a2417).withOpacity(0.9),
                        colorBlendMode: BlendMode.modulate,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        assetName,
                        style:
                            const TextStyle(fontSize: 17, color: Colors.black),
                      )
                    ],
                  )),
            ),
    );
  }
}
