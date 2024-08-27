import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';

class PaymentAnimation extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  AnimationController get controller => _controller;
  Animation<double> get animation => _animation;

  @override
  void onInit() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat(reverse: true);
    _animation = Tween<double>(begin: -1, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    super.onInit();
  }

  @override
  void onClose() {
    _controller.dispose();
    super.onClose();
  }
}

class PaymentGradientWidget extends GetView<PaymentAnimation> {
  const PaymentGradientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentAnimation>(
      builder: (controller) => ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            begin: Alignment(-1 - controller._animation.value, 0.0),
            end: Alignment(1 + controller._animation.value, 0.0),
            colors: buttongradient,
          ).createShader(bounds);
        },
        child: AnimatedBuilder(
          animation: controller.controller,
          builder: (context, child) {
            return const Text(
              'Verifying Payments',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            );
          },
        ),
      ),
    );
  }
}
