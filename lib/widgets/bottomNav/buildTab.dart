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

  const BuildTab(
      {super.key,
      required this.index,
      required this.imageAsset,
      required this.title,
      required this.focuss,
      required this.onClick});

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
                color: focuss.value == true ? const Color(0xfffcdc2a).withOpacity(0.9) : const Color(0xff0a2417).withOpacity(0.9),
                colorBlendMode: BlendMode.modulate,
              ),
              Text(title,
                  style: TextStyle(
                    fontSize: 10,
                    color: focuss.value == true
                        ? const Color(0xfffcdc2a)
                        : const Color(0xff0a2417),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
