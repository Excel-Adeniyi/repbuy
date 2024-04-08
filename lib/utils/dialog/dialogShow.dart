import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/Loader/loader_controller.dart';
import 'package:shapmanpaypoint/services/operatorsService.dart';
import 'package:shapmanpaypoint/widgets/amountPrompt/amountPrompt.dart';
import 'package:shapmanpaypoint/utils/width.dart';

import '../colors/coloors.dart';

class Customup extends StatelessWidget {
  final String title; // Define the title parameter

  const Customup({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoaderController _loaderController = Get.put(LoaderController());
    final fetchOperator = FetchOperatorService();
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
                child: Obx(
                  () => _loaderController.isLoading.value
                      ? const SizedBox(
                          height: 10,
                          width: 10,
                          child: CircularProgressIndicator(color: Colors.white))
                      : TextButton(
                          onPressed: () {
                            Get.to(AmountPrompt(title: title));
                            fetchOperator.operators();
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
