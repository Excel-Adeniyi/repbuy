import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';
import 'package:shapmanpaypoint/utils/responsiveness/buttonWidth.dart';
import 'package:shapmanpaypoint/utils/width.dart';

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = calculateContainerWidth(context);
    final buttonWidth = calculateButtonWidth(context);
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
        child: SizedBox(
          width: screenWidth,
          child: Column(
            children: [
              const Text(
                'Payment Summary',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 400,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 250,
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            gradient: LinearGradient(
                                colors: buttongradient,
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight)),
                        child: const Center(
                          child: Text(
                            'Payment reference number',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('EST-19297'),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                        'Hello Obinna Victor, we are waiting for your transfer'),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(color: Colors.grey),
                      child: const SizedBox(
                        width: 400,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Amount'),
                            Text('NGN 50'),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Account Name'),
                          Text('Technology Limited')
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(color: Colors.grey),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Bank Name'), Text('ZENITH BANK')],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Account Number'), Text('1121789209')],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(color: Colors.grey),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Switch Code'), Text('ZEIGBELA')],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: buttonWidth,
                child: Container(
                  width: 400,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.white, Color.fromARGB(255, 160, 153, 153)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                       BoxShadow(
                        color: Color.fromARGB(151, 0, 0, 0),
                        offset: Offset(-1, 1.1),
                        blurRadius: 10.0,
                        blurStyle: BlurStyle.inner,
                      ),
                    ],
                  ),
                  child: TextButton(
                      onPressed: () {
                        Get.toNamed('funding');
                      },
                      child: const Text(
                        'close',
                        style: TextStyle(fontSize: 16, color: Colors.purple),
                      )),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
