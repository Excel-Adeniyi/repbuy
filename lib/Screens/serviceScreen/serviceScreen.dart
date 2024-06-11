import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/giftcard/gift_card.dart';
import 'package:shapmanpaypoint/services/GiftCard/giftcard_auth.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';
import 'package:shapmanpaypoint/utils/responsiveness/buttonWidth.dart';
import 'package:shapmanpaypoint/utils/width.dart';

import '../Dashboard/Header/header.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final containerWidth = calculateButtonWidth(context);
    final screenSize = calculateContainerWidth(context);
    final authService = GiftCardAuth();
    return Column(
      children: [
        DashboardHeader(),
        SizedBox(
          width: screenSize,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
                    child: SizedBox(
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                                  colors: buttongradient,
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight)
                              .createShader(bounds);
                        },
                        child: const Text(
                          'Our Services',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Get.toNamed('recharge', arguments: 'Airtime Top up');
                        },
                        child: Container(
                          width: containerWidth,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0, color: const Color(0xff0a2417)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 0, 1.0, 0),
                            child: Column(
                              children: [
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Airtime',
                                    style: TextStyle(color: Colors.black),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                SizedBox(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Image.asset(
                                      'lib/assets/calling.png',
                                      height: 40,
                                      color: const Color(0xff0a2417)
                                          .withOpacity(0.9),
                                      colorBlendMode: BlendMode.modulate,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Get.toNamed('data');
                        },
                        child: Container(
                          width: containerWidth,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0, color: const Color(0xff0a2417)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 0, 1.0, 0),
                            child: Column(
                              children: [
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Data Plan',
                                    style: TextStyle(color: Colors.black),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                SizedBox(
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Image.asset(
                                      'lib/assets/signal.png',
                                      height: 40,
                                      color: const Color(0xff0a2417)
                                          .withOpacity(0.9),
                                      colorBlendMode: BlendMode.modulate,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Get.toNamed('/utility');
                        },
                        child: Container(
                          width: containerWidth,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0, color: const Color(0xff0a2417)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 0, 1.0, 0),
                            child: Column(
                              children: [
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Electric Bill',
                                    style: TextStyle(color: Colors.black),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                SizedBox(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Image.asset(
                                      'lib/assets/electricity.png',
                                      height: 40,
                                      color: const Color(0xff0a2417)
                                          .withOpacity(0.9),
                                      colorBlendMode: BlendMode.modulate,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Get.to(GiftCard());
                          authService.auth();
                        },
                        child: Container(
                          width: containerWidth,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0, color: const Color(0xff0a2417)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 0, 1.0, 0),
                            child: Column(
                              children: [
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Gift Card',
                                    style: TextStyle(color: Colors.black),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                SizedBox(
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Image.asset(
                                      'lib/assets/gift-card.png',
                                      height: 40,
                                      color: const Color(0xff0a2417)
                                          .withOpacity(0.9),
                                      colorBlendMode: BlendMode.modulate,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: Stack(alignment: Alignment.center, children: [
                          const Text(
                            "--Coming Soon--",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w800,
                                fontSize: 12),
                          ),
                          Opacity(
                            opacity: 0.6,
                            child: Container(
                              width: containerWidth,
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.0,
                                      color: const Color(0xff0a2417)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8.0, 0, 1.0, 0),
                                child: Column(
                                  children: [
                                    const Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Sport Wallet',
                                        style: TextStyle(color: Colors.black),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    SizedBox(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Image.asset(
                                          'lib/assets/balls-sports.png',
                                          height: 40,
                                          color: const Color(0xff0a2417)
                                              .withOpacity(0.9),
                                          colorBlendMode: BlendMode.modulate,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: Stack(alignment: Alignment.center, children: [
                          const Text(
                            "--Coming Soon--",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w800,
                                fontSize: 12),
                          ),
                          Opacity(
                            opacity: 0.6,
                            child: Container(
                              width: containerWidth,
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.0,
                                      color: const Color(0xff0a2417)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(8.0, 0, 1.0, 0),
                                child: Column(
                                  children: [
                                    const Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Cable Tv',
                                        style: TextStyle(color: Colors.black),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    SizedBox(
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Image.asset(
                                          'lib/assets/tv-box.png',
                                          height: 40,
                                          color: const Color(0xff0a2417)
                                              .withOpacity(0.9),
                                          colorBlendMode: BlendMode.modulate,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
