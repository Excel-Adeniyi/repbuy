import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Screens/dashboard/Tabs/Dashboardtab/Dashboardtab.dart';
import 'package:shapmanpaypoint/widgets/amountPrompt/saveBeneficiary.dart';

import '../../utils/colors/coloors.dart';
import '../../utils/width.dart';

class CompletedAmount extends StatelessWidget {
  final String title;
  final String purchase;
  CompletedAmount({
    Key? key,
    required this.title,
  })  : purchase = title == 'Data Top up' ? 'Data' : 'Airtime',
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
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
                    return const LinearGradient(colors: [
                      Color(0xFF5423bb),
                      Color(0xFF8629b1),
                      Color(0xFFa12cab),
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight)
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
                      : 'NGN 1,500.00 $purchase was sent Successfully',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: title == 'Electricity Bill Payment' ? 18 : 13),
                ),
                Text(
                  title == 'Electricity Bill Payment'
                      ? 'KAEDECO PRE PAID N10,107.50 was'
                      : 'to',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: title == 'Electricity Bill Payment' ? 18 : 13),
                ),
                Text(
                  title == 'Electricity Bill Payment'
                      ? 'successful'
                      : '"08067885911"',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: title == 'Electricity Bill Payment' ? 18 : 24),
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
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                  width: calculateContainerWidth(context),
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
                      Get.toNamed('/dashboard');
                    },
                    child: Text(
                      title == 'Electricity Bill Payment' ? 'Okay' : 'Done',
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
    );
  }
}
