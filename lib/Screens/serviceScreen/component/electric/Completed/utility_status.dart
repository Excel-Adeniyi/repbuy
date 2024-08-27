import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/Clear/clear_controller.dart';
import 'package:shapmanpaypoint/controller/Purchase_successful/purchase_controller.dart';
import 'package:shapmanpaypoint/controller/ShareController/share_controller.dart';
import 'package:shapmanpaypoint/controller/master_controller/master_controller.dart';
import 'package:shapmanpaypoint/controller/utility_controller/utility_controller.dart';
import 'package:shapmanpaypoint/utils/Loader/loader.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';
import 'package:shapmanpaypoint/widgets/amountPrompt/saveBeneficiary.dart';
import 'package:shapmanpaypoint/widgets/button/newbutton.dart';

class UCompletedAmount extends StatelessWidget {
  final String title;
  final String purchase;
  final PurchaseResponse purchaseController = Get.put(PurchaseResponse());
  // final AirtimeCController airtimeCController = Get.find();
  final MasterController masterController = Get.find<MasterController>();
  final ClearController clearController = Get.put(ClearController());
  final UtilityController utilityController = Get.find<UtilityController>();
// final databundle
  // final _contactPickerController = Get.find<ContactPickerController>();
  UCompletedAmount({
    super.key,
    required this.title,
  })  : purchase = title == 'Data Top up'
            ? 'Data'
            : title == "Electric Bill"
                ? "Utility Bill"
                : 'Airtime';
  final ShareController shareController = Get.put(ShareController());
  final GlobalKey globalKey = GlobalKey();
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
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Obx(() {
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
                      RepaintBoundary(
                        key: globalKey,
                        child: Column(children: [
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
                          purchaseController.pending.value
                              ? const Icon(
                                  Icons.punch_clock,
                                  size: 100,
                                  color: Color.fromARGB(255, 150, 114, 6),
                                )
                              : Image.asset(
                                  'lib/assets/wow.png',
                                  height: 300,
                                ),
                          purchaseController.pending.value
                              ? Text(
                                  "Processing",
                                  style: TextStyle(
                                      color: Colors.amber[700],
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                )
                              : const SizedBox.shrink(),
                          const SizedBox(height: 20),
                          purchaseController.pending.value
                              ? Text(
                                  utilityController.processMessage.value,
                                  textAlign: TextAlign.center,
                                )
                              : const SizedBox.shrink(),
                          const SizedBox(height: 20),
                          Text(
                            'Your Electricity Bill (Meter Number: ${utilityController.billerMeter.value})',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            utilityController.utilityName.value,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(height: 20),
                        ]),
                      ),
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
                                onPressed: () {
                                  shareController.captureandImage(globalKey);
                                },
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
                      const UniversalButton(
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
                                title == "Data Top Up"
                                    ? Get.toNamed(
                                        '/data',
                                      )
                                    : Get.toNamed('/recharge',
                                        arguments: 'Airtime Top up');
                                clearController.clearForm();
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
                            child: GestureDetector(
                              onTap: () {
                                utilityController.ntransactionId.value = 0;
                                utilityController.utilityPackage.value =
                                    "Select Service";
                                utilityController.utilityServiceType.value = "";
                                utilityController.minITA.value = 00.0;
                                utilityController.maxITA.value = 00.0;
                                utilityController.minSmall.value = false;
                                utilityController.maxBig.value = false;
                                utilityController.utilityId.value = 0;
                                utilityController.utilityProvider.value = '';
                                utilityController.utilityName.value = '';
                                utilityController.isMeterComplete.value = false;
                                utilityController.billerMeter.value = "";
                                utilityController.purchasePrice.value = "";
                                utilityController.commission.value = 100;
                                utilityController.vat.value = 7.50;
                                utilityController.utilityPaystackInt.value = 0;
                                utilityController.utilitySum.value = '';
                                utilityController.countryCode.value = '';
                                utilityController.processMessage.value = '';
                              },
                              child: const UniversalButton(
                                  route: "/dashboard",
                                  buttonText: 'Dashboard',
                                  withIcon: "no"),
                            )
                            // child: TextButton(
                            //     onPressed: () {
                            //       Get.toNamed('/dashboard');
                            //       clearController.clearForm();
                            //     },
                            //     child: const Text(
                            //       "Dashboard",
                            //       style: TextStyle(color: Colors.white),
                            //     )),
                            )
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
