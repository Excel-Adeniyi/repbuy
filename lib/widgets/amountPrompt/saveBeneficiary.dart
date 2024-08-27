import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/widgets/amountPrompt/completed_payment.dart';
import 'package:shapmanpaypoint/widgets/amountPrompt/successBeneficiary.dart';

import '../../utils/colors/coloors.dart';
import '../../utils/width.dart';

class BeneciarySave extends StatelessWidget {
  final String title;
  const BeneciarySave({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Get.to(CompletedAmount(title: title));
                  },
                  child: const Icon(
                    Icons.close,
                    size: 35,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 30),
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(colors: [
                      Color(0xFF5423bb),
                      Color(0xFF8629b1),
                      Color(0xFFa12cab),
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight)
                        .createShader(bounds);
                  },
                  child: const Text(
                    "Add Beneficiary",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Please enter a unique nickname',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Nick Name', border: OutlineInputBorder()),
                  ),
                )
              ],
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
                  Get.to(const SuccessBeneficiary());
                },
                child: const Text(
                  'Save Beneficiary',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
