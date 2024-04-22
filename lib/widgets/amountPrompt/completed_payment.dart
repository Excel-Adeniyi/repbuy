import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/AirtimeTopUp/airtimeController.dart';
import 'package:shapmanpaypoint/controller/Clear/clear_controller.dart';
import 'package:shapmanpaypoint/controller/DataBundle/data_bundle.dart';
import 'package:shapmanpaypoint/controller/Purchase_successful/purchase_controller.dart';
import 'package:shapmanpaypoint/controller/contact_picker/contact_picker.dart';
import 'package:shapmanpaypoint/controller/master_controller/master_controller.dart';
import 'package:shapmanpaypoint/utils/Loader/loader.dart';
import 'package:shapmanpaypoint/widgets/amountPrompt/saveBeneficiary.dart';
import 'package:shapmanpaypoint/widgets/button/newbutton.dart';

import '../../utils/colors/coloors.dart';
import '../../utils/width.dart';

class CompletedAmount extends StatelessWidget {
  final String title;
  final String purchase;
  final PurchaseResponse purchaseController = Get.put(PurchaseResponse());
  final AirtimeCController airtimeCController = Get.find();
  final MasterController masterController = Get.find<MasterController>();
  final ClearController clearController = Get.put(ClearController());
// final databundle
  final _contactPickerController = Get.find<ContactPickerController>();
  CompletedAmount({
    Key? key,
    required this.title,
  })  : purchase = title == 'Data Top up' ? 'Data' : 'Airtime',
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataBundleController =
        masterController.databundleController.value == true
            ? Get.find<DataBundleController>()
            : Get.put(DataBundleController());
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
            print("CHECKS ${purchaseController.isLoading.value}");
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
                                  colors: [
                                Color(0xFF5423bb),
                                Color(0xFF8629b1),
                                Color(0xFFa12cab),
                              ],
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
                      Image.asset(
                        'lib/assets/wow.png',
                        height: 300,
                      ),
                      Text(
                        title == 'Electricity Bill Payment'
                            ? 'Your Electricity Bill (ID: 909090687895)'
                            : title == "Data Top Up"
                                ? ' Data bundle of ${dataBundleController.priceController.text} was sent Successfully'
                                : ' Airtime of ${airtimeCController.amount.value} was sent Successfully',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                title == 'Electricity Bill Payment' ? 18 : 13),
                      ),
                      Text(
                        title == 'Electricity Bill Payment'
                            ? 'KAEDECO PRE PAID N10,107.50 was'
                            : 'to',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                title == 'Electricity Bill Payment' ? 18 : 13),
                      ),
                      Text(
                        title == 'Electricity Bill Payment'
                            ? 'successful'
                            : title == "Data Top Up"
                                ? '"${_contactPickerController.phonController.phoneController.text}"'
                                : '"${airtimeCController.number.value}"',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                title == 'Electricity Bill Payment' ? 18 : 24),
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
                      UniversalButton(
                          route: '/dashboard',
                          buttonText: title == 'Electricity Bill Payment'
                              ? 'Okay'
                              : 'Done',
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
                            child: const UniversalButton(
                                route: "/dashboard",
                                buttonText: 'Dashboard',
                                withIcon: "no")
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
