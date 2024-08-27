import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors/coloors.dart';
import '../../utils/width.dart';

class SuccessBeneficiary extends StatelessWidget {
  const SuccessBeneficiary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                child: const Text(
                  "Beneficiary Added",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Image.asset(
                'lib/assets/happy-face.png',
                width: 150,
              ),
              const Text(
                'Beneficiary has be added',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black38),
              ),
              const Text(
                'Successfully',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black38),
              ),
              const SizedBox(
                height: 100,
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
                  child: const Text(
                    'Done',
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
