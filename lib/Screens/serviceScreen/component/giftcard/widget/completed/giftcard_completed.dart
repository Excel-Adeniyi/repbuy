import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/Clear/clear_controller.dart';
import 'package:shapmanpaypoint/controller/GiftCard/gift_card_controller.dart';
import 'package:shapmanpaypoint/controller/Purchase_successful/purchase_controller.dart';
import 'package:shapmanpaypoint/controller/master_controller/master_controller.dart';
import 'package:shapmanpaypoint/controller/utility_controller/utility_controller.dart';
import 'package:shapmanpaypoint/utils/Loader/loader.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';
import 'package:shapmanpaypoint/widgets/amountPrompt/saveBeneficiary.dart';
import 'package:shapmanpaypoint/widgets/button/newbutton.dart';
import 'package:shapmanpaypoint/widgets/button/okay_close_button.dart';

class GiftCardCompletedAmount extends StatelessWidget {
  final String title = "Giftcard Complete";

  final PurchaseResponse purchaseController = Get.put(PurchaseResponse());
  // final AirtimeCController airtimeCController = Get.find();
  final MasterController masterController = Get.find<MasterController>();
  // final ClearController clearController = Get.put(ClearController());
  final GiftCardController giftCardController = Get.find<GiftCardController>();
// final databundle
  // final _contactPickerController = Get.find<ContactPickerController>();
  GiftCardCompletedAmount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String purchase = title;
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth;
    if (screenWidth < 600) {
      containerWidth = 300.0;
    } else if (screenWidth < 1200) {
      containerWidth = 400.0;
    } else {
      containerWidth = 500.0;
    }
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Obx(() {
            if (kDebugMode) {
              print("CHECKS ${purchaseController.isLoading.value}");
            }
            if (purchaseController.isLoading.value == true) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 200, width: 200, child: Loading()),
                    Text(
                      "Processing request",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              );
            } else {
              if (purchaseController.dataRx.value == true &&
                  purchaseController.allowDisplay.isTrue) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Image.asset(
                        'lib/assets/wow.png',
                        height: 300,
                      ),
          
                      const SizedBox(height: 20),
                  
                      const SizedBox(height: 20),
                      Text(
                        'Giftcard Purchase of ${giftCardController.senderCurrencyCode.value} ${giftCardController.totalPrices.value} Successful and sent to ${giftCardController.recipientemaill.value})',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                      ),
                      const SizedBox(height: 20),
                
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                            child: TextButton(
                                onPressed: () {
                                  Get.to(BeneciarySave(title: title));
                                },
                                child: Column(
                                  children: [
                                    Image.asset('lib/assets/Adduser.png'),
                                    const Text(
                                      "Save Beneficiary",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                )),
                          ),
                          Container(
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                            child: TextButton(
                                onPressed: () {},
                                child: const Column(
                                  children: [
                                    Icon(
                                      Icons.share,
                                      color: Colors.black,
                                      size: 35,
                                    ),
                                    Text(
                                      "Share Reciept",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const OkayClearerButton(
                          route: '/dashboard',
                          buttonText: 'Okay',
                          withIcon: "no")
                    ],
                  ),
                );
              } else {
                if (purchaseController.allowDisplay.isFalse) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 200, width: 200, child: Loading()),
                        Text(
                          "Processing request",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.cancel,
                          size: 200,
                          color: Color.fromARGB(255, 158, 33, 24),
                        ),
                        const Text(
                            "Sorry, currently unable to complete request"),
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
                              gradient: const LinearGradient(
                                  colors: buttongradient,
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                              borderRadius: BorderRadius.circular(16)),
                          child: TextButton(
                              onPressed: () {
                                Get.toNamed(
                                  '/giftcard',
                                );
                                // clearController.clearForm();
                              },
                              child: const Text(
                                "Try Again",
                                style: TextStyle(color: Colors.white),
                              )),
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
                                    color: const Color.fromARGB(
                                        255, 219, 218, 218),
                                    width: 2.0),
                                gradient: const LinearGradient(
                                    colors: buttongradient,
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                                borderRadius: BorderRadius.circular(16)),
                            child: const UniversalButton(
                                route: "/dashboard",
                                buttonText: 'Dashboard',
                                withIcon: "no"))
                      ],
                    ),
                  );
                }
              }
            }
          }),
        ),
      ),
    );
  }
}
