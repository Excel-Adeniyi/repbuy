import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/utils/paymentList/paylistclass.dart';
import 'package:shapmanpaypoint/widgets/amountPrompt/pin_auth.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';

import '../../utils/width.dart';

class SuccessPay extends StatelessWidget {
  final String title;
  final PaymentList paymentList;
  const SuccessPay({Key? key, required this.title, required this.paymentList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
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
              child: const Text(
                'Payment Review',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                child: const Text(
                  'For',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.left,
                )),
            Container(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    paymentList.product,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    paymentList.price,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
              alignment: Alignment.bottomLeft,
              child: Text(
                paymentList.productnumber,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 200,
              width: 500,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 193, 192, 196),
                    Color.fromARGB(255, 193, 192, 196),
                    Color.fromARGB(255, 193, 192, 196),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Package',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      GradientStyle(data: paymentList.package)
                    ],
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Commission',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      GradientStyle(data: paymentList.commission)
                    ],
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('VAT',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      GradientStyle(data: paymentList.vat)
                    ],
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Debit',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      GradientStyle(data: paymentList.totalDebit)
                    ],
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
                  width: 170,
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
                      Get.to(PinAuth(title: "Electricity Bill Payment"));
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pay',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                        SizedBox(
                          width: 20,
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
                  width: 140,
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

class GradientStyle extends StatelessWidget {
  final String data;
  const GradientStyle({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
                colors: buttongradient,
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight)
            .createShader(bounds);
      },
      child: Text(
        data,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }
}
