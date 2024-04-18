import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shapmanpaypoint/controller/Animation/payment_animation_controller.dart';
import 'package:shapmanpaypoint/controller/Loader/loader_controller.dart';
import 'package:shapmanpaypoint/controller/Payment/payment_controller.dart';
import 'package:shapmanpaypoint/controller/otp/otp_controller.dart';
import 'package:shapmanpaypoint/controller/timerController.dart';
import 'package:shapmanpaypoint/services/Airtime/airtimeTopupService.dart';
import 'package:shapmanpaypoint/services/Airtime/airtime_otp_service.dart';
import 'package:shapmanpaypoint/services/otp_service.dart';
import 'package:shapmanpaypoint/services/paymentService/payment_checkout.dart';
import 'package:shapmanpaypoint/widgets/bottomSheet/bottomsheet.dart';

// import '../../../components/dailbutton/customdailpad.dart';
import '../../utils/colors/coloors.dart';

class PinAuth extends StatelessWidget {
  final OTPController _otpController = Get.put(OTPController());
  final TimerController _timercontroller = Get.put(TimerController());
  final TextEditingController pinController = TextEditingController();
  final animationController = Get.put(PaymentAnimation());
  
  final initPay = Get.put(PaymentController());
  final String title;
  final payVoid = PaymentCheckout();
  final otpService = OTPService();
  final verifyOtpService = VerifyAirtime();

  final _loaderController = Get.find<LoaderController>();
  PinAuth({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        body: GestureDetector(
          child: Center(
            child: SingleChildScrollView(
              child: Obx(() {
                if (_loaderController.isChecker.value == true) {
                  return Dialog.fullscreen(
                    // insetAnimationCurve: Curves.easeInOut,
                    backgroundColor: Colors.white,
                    child: Center(
                      child: Column(
                        children: [
                          const PaymentGradientWidget(),
                          LoadingAnimationWidget.staggeredDotsWave(
                            color: const Color(0xFF1A1A3F),
                            size: 100,
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  if (_loaderController.isLoading.value == false) {
                    return Column(
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                gradient: LinearGradient(
                                    colors: buttongradient,
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomRight)),
                            child: Column(
                              children: [
                                PinCodeTextField(
                                  appContext: context,
                                  obscuringCharacter: '*',
                                  // controller: pinController,
                                  obscureText: true,
                                  length: 4,
                                  blinkDuration: const Duration(seconds: 2),
                                  keyboardType: TextInputType.number,
                                  blinkWhenObscuring: true,
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return '';
                                    } else if (value.length == 4) {
                                      _otpController.checkOTP(value);
                                      // print(_otpController.isComplete.value);
                                    }

                                    return null; // Return null if validation passes
                                  },
                                  pinTheme: PinTheme(
                                      activeFillColor: Colors.white,
                                      activeColor: Colors.white,
                                      selectedColor: Colors.white,
                                      selectedFillColor: Colors.white,
                                      inactiveFillColor: Colors.white,
                                      inactiveColor: Colors.white,
                                      borderWidth: 0,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(29)),
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
                              ],
                            ),
                          ),
                        ),
                        // CustomDialPad(pinController: pinController),
                        (_timercontroller.minutes.value == 0 &&
                                _timercontroller.seconds.value == 0)
                            ? TextButton(
                                onPressed: (() {
                                  _timercontroller.startTimer();
                                  otpService.otpReq();
                                }),
                                child: const Text(
                                  'Resend OTP',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.purple),
                                ))
                            : Text(
                                'Resend OTP: ${_timercontroller.minutes.value} : ${_timercontroller.seconds.value}',
                                style: const TextStyle(color: Colors.purple),
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
                                  color:
                                      const Color.fromARGB(255, 219, 218, 218),
                                  width: 2.0),
                              gradient: LinearGradient(
                                  colors:
                                      _otpController.isComplete.value == true
                                          ? buttongradient
                                          : buttongradientInactive,
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                              borderRadius: BorderRadius.circular(16)),
                          child: TextButton(
                            onPressed: () {
                              _otpController.isComplete.value == true
                                  ? (
                                      // // Get.to(CompletedAmount(title: title)),
                                      // verifyOtpService.verifyOTP(),
                                      // payVoid.chargeCardPayment(context, title),
                                       showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            SizedBox(
                                          height: 200,
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                const Text('Modal BottomSheet'),
                                                ElevatedButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  child: const Text(
                                                      'Close BottomSheet'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                     
                                    )
                                  : '';
                            },
                            child: const Text(
                              'Continue',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 200,
                            height: 200,
                            child: CircularProgressIndicator(
                              color: Colors.purple,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Processing request ..."),
                        ],
                      ),
                    );
                  }
                }
              }),
            ),
          ),
        ),
      ),
    );
  }
}
