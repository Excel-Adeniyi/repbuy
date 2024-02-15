import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';
import 'package:shapmanpaypoint/widgets/button/button.dart';
import 'package:shapmanpaypoint/widgets/button/gradientButton.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width;
    double contentWidth;
    if (buttonWidth < 300) {
      contentWidth = 200;
    } else if (buttonWidth < 400) {
      contentWidth = 400;
    } else if (buttonWidth < 600) {
      contentWidth = 600;
    } else if (buttonWidth < 1200) {
      contentWidth = 620;
    } else {
      contentWidth = 600;
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.toNamed('profile');
                    },
                    child: Image.asset(
                      'lib/assets/man.png',
                      width: 60,
                      height: 60,
                    ),
                  ),
                  const Text(
                    'Welcome, Jon Doe',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    'lib/assets/logo.png',
                    width: 60,
                    height: 60,
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Choose a payment method',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              const GradientButton(
                imagedata: 'lib/assets/mtf.png',
                assetName: 'Bank Transfer',
                pageRoute: 'banktransfer',
              ),
              const GradientButton(
                imagedata: 'lib/assets/creditCard.png',
                assetName: 'Add Bank Card',
                pageRoute: '',
              ),
              const GradientButton(
                imagedata: 'lib/assets/wallet10.png',
                assetName: 'Bitcoin',
                pageRoute: '',
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                  width: contentWidth,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(colors: buttongradient)),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Back",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
