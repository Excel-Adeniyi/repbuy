import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/AdditionalDetailsController/additional_detail_controller.dart';
import 'package:shapmanpaypoint/controller/AdditionalDetailsController/balance_controller.dart';
import 'package:shapmanpaypoint/controller/AdditionalDetailsController/payment_countdown.dart';
import 'package:shapmanpaypoint/services/AdditionalDetails/payment_checkout.dart';
import 'package:shapmanpaypoint/services/AdditionalDetails/user_additional_details.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';
import 'package:shapmanpaypoint/utils/responsiveness/buttonWidth.dart';
import 'package:shapmanpaypoint/utils/width.dart';

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final BalanceController balanceInfo = Get.put(BalanceController());
    final screenWidth = calculateContainerWidth(context);
    PaymentCountDownTimer countDownTimer = Get.put(PaymentCountDownTimer());
    final buttonWidth = calculateButtonWidth(context);
  final saveUserRecord = UserAdditionalInfo();
    AdditionalDetailsController addInfo =
        Get.find<AdditionalDetailsController>();
    PaymentCheckoutFund fundAccount = PaymentCheckoutFund();
    return Scaffold(
      // appBar: AppBar(),
      body: Obx(() {
        final totalPrice = addInfo.formatPrice();
        return Center(
            child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            width: screenWidth,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Payment Summary',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 400,
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff0a2417)),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 250,
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              gradient: LinearGradient(
                                  colors: buttongradient,
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight)),
                          child: const Center(
                            child: Text(
                              'Payment Details',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        countDownTimer
                            .formatTime(countDownTimer.overallTime.value),
                        style: TextStyle(
                            color: countDownTimer.overallTime.value < 20
                                ? Colors.red
                                : const Color(0xff0a2417)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                              style: const TextStyle(color: Colors.black),
                              spellOut: true,
                              children: <TextSpan>[
                                const TextSpan(text: 'Hello '),
                                TextSpan(
                                    text: '${addInfo.fullname}, ',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700)),
                                const TextSpan(
                                    text:
                                        'Kindly verify details before proceeding to make payment'),
                              ]),
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(color: Colors.grey),
                        child: SizedBox(
                          width: 400,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Amount'),
                              Text(
                                  '${addInfo.currency.value} ${addInfo.amount.value}'),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Transfer Charge'),
                            Text(
                              "${addInfo.currency.value} ${addInfo.transferCharge.value}",
                              style: const TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(color: Colors.grey),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Platform fee'),
                            Text(addInfo.currency.value == "NGN"
                                ? "${addInfo.currency.value} ${addInfo.localplatformCharge.value}"
                                : "${addInfo.currency.value} ${addInfo.internationalplatformCharge.value}")
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                            Text(
                              "${addInfo.currency.value} $totalPrice",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                addInfo.userInformation.value == 0
                    ? const Text(
                        'Additional Required Information',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  height: 20,
                ),
                addInfo.userInformation.value == 0
                    ? Container(
                        width: 400,
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xff0a2417)),
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 250,
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    gradient: LinearGradient(
                                        colors: buttongradient,
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight)),
                                child: const Center(
                                  child: Text(
                                    'Additional Details',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RichText(
                                text: TextSpan(
                                    style: const TextStyle(color: Colors.black),
                                    spellOut: true,
                                    children: <TextSpan>[
                                      const TextSpan(text: 'Hello '),
                                      TextSpan(
                                          text: '${addInfo.fullname}, ',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w700)),
                                      const TextSpan(
                                          text:
                                              'Kindly verify details before proceeding to Save information'),
                                    ]),
                                overflow: TextOverflow.clip,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration:
                                  const BoxDecoration(color: Colors.grey),
                              child: SizedBox(
                                width: 400,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(
                                        width: 100,
                                        child: Text(
                                          'Fullname/Company',
                                          overflow: TextOverflow.fade,
                                        )),
                                    SizedBox(
                                      child: Text(
                                        addInfo.fullname.value,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Country'),
                                  Text(
                                    addInfo.country.value,
                                    style: const TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration:
                                  const BoxDecoration(color: Colors.grey),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('State'),
                                  Text(addInfo.state.value)
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'City',
                                  ),
                                  Text(
                                    addInfo.city.value,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration:
                                  const BoxDecoration(color: Colors.grey),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Zipcode',
                                  ),
                                  Text(
                                    addInfo.zipcode.value,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Address',
                                  ),
                                  Text(
                                    addInfo.address.value,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: buttonWidth,
                  child: Container(
                    width: 400,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 170, 170, 170),
                          Color.fromARGB(255, 160, 153, 153)
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(151, 0, 0, 0),
                          offset: Offset(-1, 1.1),
                          blurRadius: 10.0,
                          blurStyle: BlurStyle.inner,
                        ),
                      ],
                    ),
                    child: TextButton(
                        onPressed: () {
                          Get.toNamed('banktransfer');
                        },
                        child: const Text(
                          'Edit ',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff0a2417)),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: buttonWidth,
                  child: Container(
                    width: 400,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: buttongradient,
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft),
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(151, 0, 0, 0),
                          offset: Offset(-1, 1.1),
                          blurRadius: 10.0,
                          blurStyle: BlurStyle.inner,
                        ),
                      ],
                    ),
                    child: TextButton(
                        onPressed: () async {
                          // Get.toNamed('banktransfer');
                          balanceInfo.calculateNewTotalOverallDeposit(
                              addInfo.amount.value);
                              addInfo.userInformation.value == 0 ? await saveUserRecord.sendRequest() : "";
                      
                          fundAccount.chargeCardPayment(context);
                        },
                        child: Text(
                          addInfo.userInformation.value == 0
                              ? 'Save & Make Payment '
                              : "Make Payment",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ));
      }),
    );
  }
}
