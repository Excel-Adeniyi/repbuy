import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/Effects/on_tap.dart';
import 'package:shapmanpaypoint/controller/Payment/payment_controller.dart';
import 'package:shapmanpaypoint/services/otp_service.dart';
import 'package:shapmanpaypoint/services/paymentService/payment_checkout.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';
import 'package:shapmanpaypoint/widgets/amountPrompt/pinAuth.dart';

class SelectPaymentMethod extends StatelessWidget {
  final String title;

  const SelectPaymentMethod({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final initPay = Get.put(PaymentController());
    final otpService = OTPService();
    final ontapEffectController = Get.find<OnTapEffect>();
    final payVoid = PaymentCheckout();
    Size screenSize = MediaQuery.sizeOf(context);
    return Obx(() {
      if (ontapEffectController.isBSopen.value == true) {
        print("GOT HERE");
        Navigator.of(context).pop();
        return const SizedBox.shrink();
      } else {
        return SizedBox(
          height: 250,
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Select Payment Method',
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    // padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(0))),
                    child: TextButton(
                        style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    const EdgeInsets.fromLTRB(16, 2, 16, 2)),
                            shape:
                                const MaterialStatePropertyAll<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                        side: BorderSide.none,
                                        borderRadius: BorderRadius.zero))),
                        onPressed: () {
                          ontapEffectController.isCard.value = false;
                          Future.delayed(
                              const Duration(milliseconds: 400),
                              () => {
                                    ontapEffectController.isWallet.value = true
                                  });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Wallet",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                            Obx(
                              () => Row(children: [
                                const Text(
                                  "NGN 0.00",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Roboto",
                                      fontSize: 14,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.wallet,
                                  color: Colors.purple,
                                ),
                                ontapEffectController.isWallet.value
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.green,
                                      )
                                    : const SizedBox(
                                        width: 0,
                                        height: 0,
                                      )
                              ]),
                            ),
                          ],
                        )),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  Container(
                    // padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(0))),
                    child: TextButton(
                        style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    const EdgeInsets.fromLTRB(16, 2, 16, 2)),
                            shape:
                                const MaterialStatePropertyAll<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                        side: BorderSide.none,
                                        borderRadius: BorderRadius.zero))),
                        onPressed: () {
                          ontapEffectController.isWallet.value = false;
                          Future.delayed(
                              const Duration(milliseconds: 400),
                              () =>
                                  {ontapEffectController.isCard.value = true});
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Card",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                            Obx(
                              () => Row(
                                children: [
                                  const Icon(
                                    Icons.credit_card,
                                    color: Colors.purple,
                                  ),
                                  ontapEffectController.isCard.value
                                      ? const Icon(
                                          Icons.check,
                                          color: Colors.green,
                                        )
                                      : const SizedBox(
                                          width: 0,
                                          height: 0,
                                        )
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Obx(
                    () => AnimatedContainer(
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
                              color: const Color.fromARGB(255, 219, 218, 218),
                              width: 1.0),
                          gradient: LinearGradient(
                              colors: ontapEffectController.isSelected.value
                                  ? isbuttongradient
                                  : buttongradient,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomRight),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                        onPressed: () {
                          ontapEffectController.isSelected.value = true;
                          Future.delayed(const Duration(milliseconds: 1000),
                              () {
                            ontapEffectController.isSelected.value = false;
                            print("WORKING");
                            if (ontapEffectController.isCard.value) {
                              payVoid.chargeCardPayment(context, title);
                            
                            } else {
                              Get.to(PinAuth(title: title));
                              otpService.otpReq();
                            }
                          });
                        },
                        child: ontapEffectController.isSelected.value == true
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                'Proceed to Payment',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}
