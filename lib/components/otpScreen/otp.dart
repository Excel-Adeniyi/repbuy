import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shapmanpaypoint/Screens/signup/pinInsertion/pin.dart';
import '../../controller/timerController.dart';
import '../../helpers/colors/coloors.dart';

class OtpScreen extends StatelessWidget {
  var pagecondition = (Get.previousRoute == '/forgetpassword');
  final TimerController _timerController = Get.put(TimerController());
  @override
  Widget build(BuildContext context) {
    final title = pagecondition ? 'Enter OTP' : 'OTP Verification';
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth;
    if (screenWidth < 600) {
      containerWidth = 300.0;
    } else if (screenWidth < 1200) {
      containerWidth = 400.0;
    } else {
      containerWidth = 500.0;
    }
    // print('dgs' + title);
    return GestureDetector(
      onTap: () {
        FocusNode().unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
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
                    child: Text(
                      pagecondition ? 'Enter OTP' : 'OTP Verification',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(pagecondition
                      ? "A four (4) digit code has been sent to this"
                      : " Enter the (4) digit code sent to your email address"),
                  pagecondition
                      ? const Text('email address')
                      : const SizedBox(),
                  pagecondition
                      ? const Text(
                          'johndoe@gmail.com',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      : const SizedBox.shrink(),
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
                      child: Column(
                        children: [
                          PinCodeTextField(
                            focusNode: FocusNode(),
                            appContext: context,
                            obscuringCharacter: '*',
                            obscureText: true,
                            length: 4,
                            blinkWhenObscuring: true,
                            pinTheme: PinTheme(
                                activeFillColor: Colors.white,
                                activeColor: Colors.white,
                                selectedColor: Colors.white,
                                selectedFillColor: Colors.white,
                                inactiveFillColor: Colors.white,
                                inactiveColor: Colors.white,
                                borderWidth: 0,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(29)),
                                fieldHeight: 50),
                            boxShadows: const [
                              BoxShadow(
                                offset: Offset(0, 1),
                                color: Colors.orange,
                                blurRadius: 0,
                              )
                            ],
                            enableActiveFill: true,
                          ),
                          Obx(() {
                            if (_timerController.timerActive.value) {
                              return Text(
                                'Resend code in: ${_timerController.minutes.toString().padLeft(2, '0')}:${_timerController.seconds.toString().padLeft(2, '0')}',
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.white),
                              );
                            } else {
                              return TextButton(
                                onPressed: () {
                                  if (_timerController.timerActive.value) {
                                    _timerController.resetTimer();
                                  } else {
                                    _timerController.startTimer();
                                  }
                                },
                                child: const Text(
                                  'click to resend code',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                              );
                            }
                          }),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Container(
                    width: containerWidth,
                    height: 40,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black45, // Shadow color
                            blurRadius: 5.0, // Blur radius
                            offset: Offset(0, 2),
                          )
                        ],
                        border: Border.all(
                            color: const Color.fromARGB(255, 219, 218, 218),
                            width: 2.0),
                        gradient: const LinearGradient(
                            colors: buttongradient,
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        borderRadius: BorderRadius.circular(16)),
                    child: TextButton(
                      onPressed: () {
                        pagecondition
                            ? Get.toNamed('/home')
                            : Get.toNamed('/insertpin')!;
                      },
                      child: Text(
                        pagecondition ? 'Submit' : 'Continue',
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
