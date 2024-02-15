import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GradientButton extends StatelessWidget {
  final String imagedata;
  final String assetName;
  final String pageRoute;
  const GradientButton(
      {Key? key,
      required this.imagedata,
      required this.assetName,
      required this.pageRoute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width;
    double contentWidth;
    if (buttonWidth < 300) {
      contentWidth = 200;
    } else if (buttonWidth < 400) {
      contentWidth = 400;
    } else if (buttonWidth < 600) {
      contentWidth = 600;
    } else if (buttonWidth < 1200) {
      contentWidth = 620;
    } else {
      contentWidth = 600;
    }

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        width: contentWidth,
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(10)),
        child: TextButton(
            onPressed: () {
              Get.toNamed(pageRoute);
            },
            child: Row(
              children: [
                Image.asset(
                  imagedata,
                  width: 50,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  assetName,
                  style: TextStyle(fontSize: 17, color: Colors.black),
                )
              ],
            )),
      ),
    );
  }
}
