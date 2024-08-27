import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurveIn extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  AnimationController get controller => _controller;
  Animation<double> get animation => _animation;

  @override
  void onInit() {
    super.onInit();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward().whenComplete(() {
      _controller.dispose();
    });
  }

  @override
  void dispose() {
    if (_controller.isAnimating) {
      _controller.dispose();
    }
    super.dispose();
  }
}
