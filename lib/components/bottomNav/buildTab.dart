import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/tabcontroller.dart';

class BuildTab extends StatelessWidget {
  final int index;
  final String imageAsset;
  final String title;
  final RxBool focuss;
  final VoidCallback
      onClick; // Each BuildTab widget should have its own FocusNode

  BuildTab(
      {Key? key,
      required this.index,
      required this.imageAsset,
      required this.title,
      required this.focuss,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TabbController controller = Get.find<TabbController>();

    return Obx(
      () => TextButton(
        onPressed: () {
          controller.changeTab(index);
          onClick();
        },
        child: Tab(
          child: Column(
            children: [
              Image.asset(
                imageAsset,
                width: 25,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 10,
                    color: focuss.value == true ? Colors.purple : Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
