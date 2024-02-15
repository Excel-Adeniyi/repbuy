import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/widgets/amountPrompt/pinAuth.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';

import '../../utils/width.dart';

class AmountPrompt extends StatelessWidget {
  final String title;
  AmountPrompt({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 200,
              width: 500,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFF5423bb),
                  Color(0xFF8629b1),
                  Color(0xFFa12cab),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'You are about to recharge airtime to',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '"08012345678"',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'NGN 500.00',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Available Balance = NGN 10,000.00',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                  height: 40,
                  width: 200,
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
                      Get.to(PinAuth(title: title));
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                SizedBox(
                  width: 100,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      side: const BorderSide(color: Colors.purple),
                    ),
                    onPressed: () {},
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(colors: [
                          Color(0xFF5423bb),
                          Color(0xFF8629b1),
                          Color(0xFFa12cab),
                        ], begin: Alignment.topLeft, end: Alignment.bottomRight)
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
            )
          ],
        ),
      ),
    );
  }
}
