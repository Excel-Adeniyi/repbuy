import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/Animation/payment_animation_controller.dart';
import 'package:shapmanpaypoint/controller/Effects/on_tap.dart';
import 'package:shapmanpaypoint/controller/Payment/payment_controller.dart';
import 'package:shapmanpaypoint/controller/otp/otp_controller.dart';
import 'package:shapmanpaypoint/controller/timerController.dart';
import 'package:shapmanpaypoint/services/Electricbill/electric_verify_pin.dart';
import 'package:shapmanpaypoint/widgets/PinWidget/pin_widget.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';

class UPinAuth extends StatelessWidget {
  final OTPController _otpController = Get.put(OTPController());
  final TimerController _timercontroller = Get.put(TimerController());
  final TextEditingController pinController = TextEditingController();
  final animationController = Get.put(PaymentAnimation());

  final initPay = Get.put(PaymentController());
  final String title;
  // final payVoid = PaymentCheckout();
  // final otpService = OTPService();
  final verifyOtpService = UVerifyPurchase();
  final _ontapEffectController = Get.put(OnTapEffect());
  // final _loaderController = Get.find<LoaderController>();
  UPinAuth({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth;
    if (screenWidth < 600) {
      containerWidth = 300.0;
    } else if (screenWidth < 1200) {
      containerWidth = 400.0;
    } else {
      containerWidth = 500.0;
    }
    print('dgs$title');
    return GestureDetector(
      onTap: () {
        FocusNode().unfocus();
      },
      child: Scaffold(
        body: GestureDetector(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                              colors: [
                            Color(0xFF5423bb),
                            Color(0xFF8629b1),
                            Color(0xFFa12cab),
                          ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)
                          .createShader(bounds);
                    },
                    child: const Text(
                      'Enter Transaction Pin',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset('lib/assets/padlock.png'),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: containerWidth,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          gradient: LinearGradient(
                              colors: buttongradient,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomRight)),
                      child: const Column(
                        children: [
                          PinWidget(),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Obx(
                    () => _otpController.isComplete.isTrue
                        ? AnimatedContainer(
                            duration: const Duration(milliseconds: 1000),
                            // margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                            height: 50,
                            width: screenSize.width * 0.8,
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black45, // Shadow color
                                    blurRadius: 5.0, // Blur radius
                                    offset: Offset(0, 2),
                                  )
                                ],
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 219, 218, 218),
                                    width: 1.0),
                                gradient: LinearGradient(
                                    colors:
                                        _ontapEffectController.isTapped.value
                                            ? isbuttongradient
                                            : buttongradient,
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomRight),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextButton(
                              onPressed: () {
                                _ontapEffectController.isTapped.value = true;
                                Future.delayed(
                                    const Duration(milliseconds: 1000), () {
                                  _ontapEffectController.isTapped.value = false;
                                  // print("WORKING");
                                  verifyOtpService.verifyOTP(title);
                                });
                              },
                              child:
                                  _ontapEffectController.isTapped.value == true
                                      ? const CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Continue',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(
                                              Icons.east,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
