import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/services/SignupService/otp_service.dart';
import 'package:shapmanpaypoint/widgets/otpScreen/otp.dart';
import 'package:shapmanpaypoint/utils/responsiveness/responsiveness.dart';

import '../../../utils/colors/coloors.dart';

class CompletionScreen extends StatelessWidget {
  const CompletionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double containerWidth = ScreenWidth.calculateContainerWidth(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
            child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/assets/wow.png',
                  width: containerWidth,
                ),
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(colors: [
                      Color(0xFF5423bb),
                      Color(0xFF8629b1),
                      Color(0xFFa12cab),
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
                        .createShader(bounds);
                  },
                  child: const Text(
                    'WOW!',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                const Text(
                  'Copy Your account has been created successfully',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 60,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: containerWidth,
                    height: 35,
                    decoration: const BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.black45)],
                        gradient: LinearGradient(
                            colors: buttongradient,
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: TextButton(
                      onPressed: () => {Get.toNamed("/otp")},
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ]),
        )),
      ),
    );
  }
}
