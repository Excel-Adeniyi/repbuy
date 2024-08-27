import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/widgets/paymentReview/successPay.dart';
import 'package:shapmanpaypoint/utils/width.dart';

import '../colors/coloors.dart';
import '../paymentList/paylistclass.dart';

class Otherpayment extends StatelessWidget {
  final String title; // Define the title parameter
  final PaymentList paymentList;
  const Otherpayment({super.key, required this.title, required this.paymentList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(colors: [
                    Color(0xFF5423bb),
                    Color(0xFF8629b1),
                    Color(0xFFa12cab),
                  ], begin: Alignment.topCenter, end: Alignment.bottomRight)
                      .createShader(bounds);
                },
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Image.asset('lib/assets/loading.png'),
              const SizedBox(
                height: 50,
              ),
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(colors: [
                    Color(0xFF5423bb),
                    Color(0xFF8629b1),
                    Color(0xFFa12cab),
                  ], begin: Alignment.topCenter, end: Alignment.bottomRight)
                      .createShader(bounds);
                },
                child: const Text(
                  'Processing',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 50,
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
                    Get.to(SuccessPay());
                  },
                  child: const Text(
                    'Continue',
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
      ),
    );
  }
}
