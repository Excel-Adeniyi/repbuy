import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shapmanpaypoint/controller/AirtimeTopUp/airtimeController.dart';
import 'package:shapmanpaypoint/controller/Animation/curve_easin_controller.dart';
import 'package:shapmanpaypoint/controller/Animation/payment_animation_controller.dart';
import 'package:shapmanpaypoint/controller/Animation/shimmer_controller.dart';
import 'package:shapmanpaypoint/controller/Effects/on_tap.dart';
import 'package:shapmanpaypoint/controller/Loader/loader_controller.dart';
import 'package:shapmanpaypoint/services/otp_service.dart';
import 'package:shapmanpaypoint/widgets/amountPrompt/pin_auth.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';
import 'package:shapmanpaypoint/widgets/selectPayementMethod/select_payment_method.dart';

class AmountPrompt extends StatelessWidget {
  final String title;
  AmountPrompt({Key? key, required this.title}) : super(key: key);
  final _airtimeCController = Get.find<AirtimeCController>();
  // final _phoneNumberController = Get.find<ContactPickerController>();
  final _loaderController = Get.find<LoaderController>();
  final _curveInController = Get.put(CurveIn());
  final _shimmerController = Get.put(ShimmerEffect());
  final _ontapEffectController = Get.put(OnTapEffect());
  final otpService = OTPService();
  final animationController = Get.put(PaymentAnimation());
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          if (_loaderController.isChecker.value == true) {
            return Dialog.fullscreen(
              // insetAnimationCurve: Curves.easeInOut,
              backgroundColor: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _loaderController.isVerifyFailed.value == false
                        ? const PaymentGradientWidget()
                        : const Text(
                            "Unable to verify payment Kindly contact support",
                            style: TextStyle(
                                color: Colors.red,
                                fontFamily: "Roboto",
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                    _loaderController.isVerifyFailed.value == false
                        ? LoadingAnimationWidget.staggeredDotsWave(
                            color: const Color(0xFF1A1A3F),
                            size: 100,
                          )
                        : TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _loaderController.isVerifyFailed.value = false;
                              _loaderController.isChecker.value = false;
                            },
                            child: const Text(
                              "Close",
                              style: TextStyle(color: Colors.black),
                            ))
                  ],
                ),
              ),
            );
          } else {
            if (_loaderController.isLoading == false) {
              return AnimatedBuilder(
                animation: _curveInController.controller,
                builder: ((context, child) {
                  return Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return const LinearGradient(
                                      colors: [
                                    Color(0xFF5423bb),
                                    Color.fromARGB(255, 123, 19, 172),
                                    Color(0xFFa12cab),
                                  ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight)
                                  .createShader(bounds);
                            },
                            child: Text(
                              title ?? "Top Up",
                              style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Transform.translate(
                            offset: Offset(
                                0,
                                MediaQuery.of(context).size.height *
                                    (1 - _curveInController.animation.value)),
                            child: AnimatedBuilder(
                              animation: _shimmerController.animationController,
                              builder: ((context, child) {
                                return Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 15),
                                  height: 270,
                                  width: screenSize.width * 0.9,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                    gradient: LinearGradient(
                                        colors: const [
                                          Color.fromARGB(235, 83, 35, 187),
                                          Color(0xFF5423bb),
                                          Color.fromARGB(234, 70, 38, 139),
                                          Color.fromARGB(228, 116, 41, 177),
                                          Color(0xFFa12cab),
                                        ],
                                        begin: Alignment(
                                            -1 -
                                                _shimmerController
                                                    .animationController.value,
                                            0),
                                        end: Alignment(
                                            1 +
                                                _shimmerController
                                                    .animationController.value,
                                            0)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Text(
                                        'Kindly Verify Transaction',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontFamily: "Shantell_Sans",
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const Divider(),
                                      const Text(
                                        'phone number:',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: "Roboto",
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        _airtimeCController.number.value
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: "Roboto",
                                            fontWeight: FontWeight.w400),
                                      ),
                                      // const Divider(),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text(
                                        'provider:',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: "Roboto",
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        _airtimeCController.network.value
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      // const Divider(),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text(
                                        'amount:',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: "Roboto",
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        "NGN" +
                                            " " +
                                            _airtimeCController.amount.value
                                                .toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Roboto",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: 300,
                                        padding: const EdgeInsets.all(8.0),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8)),
                                        ),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Available Balance:',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Roboto',
                                                  fontStyle: FontStyle.italic,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              'NGN 0.00',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 102, 37, 177),
                                                  fontSize: 18,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Obx(
                            () => Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                AnimatedContainer(
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
                                          colors: _ontapEffectController
                                                  .isTapped.value
                                              ? isbuttongradient
                                              : buttongradient,
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomRight),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextButton(
                                    onPressed: () {
                                      _ontapEffectController.isTapped.value =
                                          true;
                                      Future.delayed(
                                          const Duration(milliseconds: 1000),
                                          () {
                                        _ontapEffectController.isTapped.value =
                                            false;
                                        _ontapEffectController.isBSopen.value =
                                            false;
                                        print("WORKING");
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              SelectPaymentMethod(title: title),
                                        );

                                        // Get.to(PinAuth(title: title));
                                      });
                                    },
                                    child: _ontapEffectController
                                                .isTapped.value ==
                                            true
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
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 1000),
                                  width: screenSize.width * 0.8,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.purple),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10))),
                                  child: TextButton(
                                    onPressed: () {
                                      Get.toNamed('/dashboard');
                                    },
                                    child: ShaderMask(
                                      shaderCallback: (Rect bounds) {
                                        return const LinearGradient(
                                                colors: [
                                              Color(0xFF5423bb),
                                              Color(0xFF8629b1),
                                              Color(0xFFa12cab),
                                            ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight)
                                            .createShader(bounds);
                                      },
                                      child: const Text(
                                        "Cancel",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
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
          ;
        }),
      ),
    );
  }
}
