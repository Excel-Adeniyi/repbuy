import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Screens/login/login.dart';
import 'package:shapmanpaypoint/widgets/slider/slide1.dart';

import '../../controller/onboardingcontroller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> slides = [
      const Slide1(),
      const Slide2(),
      const Slide3()
    ];
    final int totalSlides = slides.length;
    OnboardingController onboardingController = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          Swiper(
            itemCount: slides.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: slides[index],
              );
            },
            loop: false,
            pagination: const SwiperPagination(),
            onIndexChanged: (index) {
              onboardingController.updateButtonVisibility(index);
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Obx(() {
              final bool isLastSlide =
                  onboardingController.isLastSlide(slides.length);
              final bool isLastSlideVisible = isLastSlide &&
                  onboardingController.currentIndex.value == slides.length - 1;

              return Visibility(
                visible: isLastSlideVisible,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/home');
                    },
                    child: const Text('Get Started'),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
