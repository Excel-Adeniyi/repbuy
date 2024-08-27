import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/electric/widget/payment_method.dart';
import 'package:shapmanpaypoint/controller/Animation/payment_animation_controller.dart';
import 'package:shapmanpaypoint/controller/Effects/on_tap.dart';
import 'package:shapmanpaypoint/controller/Loader/loader_controller.dart';
import 'package:shapmanpaypoint/controller/rechargeController.dart';
import 'package:shapmanpaypoint/controller/utility_controller/utility_controller.dart';
import 'package:shapmanpaypoint/services/Electricbill/electricbill_auth_service.dart';
// import 'package:shapmanpaypoint/utils/paymentList/paylistclass.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';
import 'package:shapmanpaypoint/utils/responsiveness/buttonWidth.dart';

class SuccessPay extends StatelessWidget {
  final String title = 'Electric';
  // PaymentList? paymentList;
  SuccessPay({super.key});
  final _ontapEffectController = Get.put(OnTapEffect());
  final phonController = Get.put(RechargeController());
  final _loaderController = Get.put(LoaderController());
  final electricService = ElectricAuthService();

  final animationController = Get.put(PaymentAnimation());

  @override
  Widget build(BuildContext context) {
    UtilityController utilityController = Get.find<UtilityController>();
    print(utilityController.purchasePrice.value);
    Size screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
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
            return SizedBox(
              width: screenSize.width * 0.9,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                                colors: buttongradient,
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight)
                            .createShader(bounds);
                      },
                      child: const Text(
                        'Payment Review',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                        child: const Text(
                          'For',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.left,
                        )),
                    Container(
                      padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            utilityController.utilityProvider.value,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            utilityController.purchasePrice.value,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        utilityController.billerMeter.value,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 200,
                      width: 500,
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: bggradient,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Package',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                              GradientStyle(
                                  data: utilityController.utilityName.value)
                            ],
                          ),
                          const Divider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Commission',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                              GradientStyle(data: '100')
                            ],
                          ),
                          const Divider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('VAT',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                              GradientStyle(data: '7.50')
                            ],
                          ),
                          const Divider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Total',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              GradientStyle(
                                  data: utilityController.utilitySum.value)
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 1000),
                          // margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                          height: 50,
                          width: calculateButtonWidth(context),
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
                                  width: 1.0),
                              gradient: LinearGradient(
                                  colors: _ontapEffectController.isTapped.value
                                      ? isbuttongradient
                                      : buttongradient,
                                  begin: Alignment.bottomRight,
                                  end: Alignment.topCenter),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextButton(
                            onPressed: () {
                              electricService.electricAuth();
                              _ontapEffectController.isTapped.value = true;
                              Future.delayed(const Duration(milliseconds: 1000),
                                  () {
                                _ontapEffectController.isTapped.value = false;
                                _ontapEffectController.isBSopen.value = false;
                                print("WORKING");
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      const UtilitySelectPaymentMethod(
                                          title: "Electric Bill"),
                                );
                                // Get.to(PinAuth(title: title));
                              });
                            },
                            child: _ontapEffectController.isTapped.value == true
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
                          width: calculateButtonWidth(context),
                          height: 50,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xff0a2417)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed('/dashboard');
                            },
                            child: ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return const LinearGradient(
                                        colors: buttongradient,
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
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}

class GradientStyle extends StatelessWidget {
  final String data;
  const GradientStyle({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
                colors: textgradient,
                begin: Alignment.bottomLeft,
                end: Alignment.bottomLeft)
            .createShader(bounds);
      },
      child: Text(
        data,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }
}
