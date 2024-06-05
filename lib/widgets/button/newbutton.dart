import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/Effects/on_tap.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';
import 'package:shapmanpaypoint/utils/responsiveness/buttonWidth.dart';

class UniversalButton extends StatelessWidget {
  final String route;
  final String buttonText;
  final String withIcon;
  const UniversalButton(
      {super.key,
      required this.route,
      required this.buttonText,
      required this.withIcon});

  @override
  Widget build(BuildContext context) {
    final ontapEffectController = Get.put(OnTapEffect());
    
    return Obx(() => AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          // margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
          height: 50,
          width: calculateButtonWidth(context),
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black45, // Shadow color
                  blurRadius: 5.0, // Blur radius
                  offset: Offset(0, 2),
                )
              ],
              border: Border.all(
                  color: const Color.fromARGB(255, 219, 218, 218), width: 1.0),
              gradient: LinearGradient(
                  colors: ontapEffectController.isTapped.value
                      ? isbuttongradient
                      : buttongradient,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(10)),
          child: TextButton(
              onPressed: () {
                ontapEffectController.isTapped.value = true;
                Future.delayed(const Duration(milliseconds: 1000), () {
                  ontapEffectController.isTapped.value = false;
                  // print("WORKING");
                  // verifyOtpService.verifyOTP(title);
                  if (route.isNotEmpty) {
                    Get.toNamed(route);
                    
                  }
                });
              },
              child: ontapEffectController.isTapped.value == true
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : withIcon == "yes"
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              buttonText,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.east,
                              color: Colors.white,
                            )
                          ],
                        )
                      : Text(
                          buttonText,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        )),
        ));
  }
}
