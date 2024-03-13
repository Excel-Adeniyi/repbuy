import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/cable/cableScreen.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/electric/electricityScreen.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/rechargecardndata/recharge_screen.dart';

import '../../Header/header.dart';

class DashboardTab extends StatelessWidget {
  final double containerWidth;
  const DashboardTab({Key? key, required this.containerWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DashboardHeader(),
        Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: containerWidth,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 130,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.1),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.toNamed('recharge',
                                  arguments: 'Airtime Top up');
                            },
                            child: const Text(
                              'Airtime',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                          Image.asset(
                            'lib/assets/calling.png',
                            width: 40,
                          )
                        ],
                      )),
                  Container(
                    width: 130,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.toNamed('recharge', arguments: 'Data Top up');
                          },
                          child: const Text(
                            'Data Plan',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ),
                        Image.asset(
                          'lib/assets/signal.png',
                          width: 40,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: containerWidth,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 130,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.1),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.to(Electric());
                            },
                            child: const Text(
                              'Electricity',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                          Image.asset(
                            'lib/assets/electricity.png',
                            width: 40,
                          )
                        ],
                      )),
                  Container(
                    width: 130,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.to(CableScreen());
                          },
                          child: const Text(
                            'Cable Tv',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ),
                        Image.asset(
                          'lib/assets/tv-box.png',
                          width: 40,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: containerWidth,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 130,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.1),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Gift Card',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                          Image.asset(
                            'lib/assets/gift-card.png',
                            width: 40,
                          )
                        ],
                      )),
                  Container(
                    width: 130,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'More',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ),
                        Image.asset(
                          'lib/assets/menu.png',
                          width: 40,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: containerWidth,
              child: const Row(
                children: [
                  Text('Recent Activities'),
                  Expanded(child: Divider())
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: containerWidth,
              child: const Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Airtime Recharge',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          Text(
                            '7:45am 11 jul, 2020',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          )
                        ],
                      ),
                      Text(
                        '- NGN500.00',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Received Funds',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          Text(
                            '9:30am 21 sept, 2023',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          )
                        ],
                      ),
                      Text(
                        '- NGN5000.00',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
