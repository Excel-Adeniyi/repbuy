// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/Animation/onboarding_animation_controller.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';

class Slide1 extends StatelessWidget {
  const Slide1({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      widthFactor: 1.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Image.asset(
          'lib/assets/3.png',
          width: 250,
        ),
      ),
    );
  }
}

// Ensure correct import

class Slide2 extends StatelessWidget {
  const Slide2({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardAnimation controller = Get.put(OnboardAnimation());
    var dura = const Duration(seconds: 3);
    return Scaffold(body: GetBuilder<OnboardAnimation>(builder: (_) {
      return AnimatedContainer(
        duration: dura,
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: controller.animation.value > 0.5
                ? [controller.animation.value, 0.9, 0.95, 0.97]
                : [0.5, 0.1, 0.05, -controller.animation.value],
            colors: backgroundgradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'lib/assets/onboard_hand.png',
                  width: 250,
                ),
              ),
              const Text(
                "Payment Made Easy",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Pay all your bills at once, without leaving your home with REPBUY comprehensive range of services',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      );
    }));
  }
}

class Slide3 extends StatelessWidget {
  const Slide3({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardAnimation>(builder: (controller) {
      return AnimatedContainer(
        duration: const Duration(seconds: 3),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          stops: controller.animation.value > 0.5
              ? [0.9 - controller.animation.value, 0.2, 0.9]
              : [0.9, 0.2, 0.5 - controller.animation.value],
          colors: bgggradient, // Specify your gradient colors here
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          tileMode: TileMode.clamp, // Set the tile mode
          transform: const GradientRotation(0.0),
        )),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'lib/assets/onboarding3.png',
                width: 250,
              ),
            ),
            const Text(
              "Freedom to do it your way",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              'Fully | Secured | Reliable | Fast',
              style: TextStyle(
                color: Colors.white,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            )
          ],
        )),
      );
    });
  }
}
