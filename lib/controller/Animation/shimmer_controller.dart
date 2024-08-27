import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShimmerEffect extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;

  AnimationController get animationController => _animationController;

  @override
  void onInit() {
    super.onInit();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
