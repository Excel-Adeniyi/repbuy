import 'package:flutter/material.dart';

import '../Dashboard/Header/header.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double containerHeight;
    if (screenHeight < 480) {
      containerHeight = 500;
    } else if (screenHeight < 900) {
      containerHeight = 470;
    } else {
      containerHeight = 1300;
    }
    double containerWidth;
    if (screenWidth < 600) {
      containerWidth = 200.0;
    } else if (screenWidth < 1200) {
      containerWidth = 320.0;
    } else {
      containerWidth = 130.0;
    }
    return Column(
      children: [
        DashboardHeader(),
        Container(
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
                                  colors: [
                                Color(0xFF5423bb),
                                Color(0xFF8629b1),
                                Color(0xFFa12cab),
                              ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)
                              .createShader(bounds);
                        },
                        child: const Text(
                          'Our Services',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
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
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          child: Container(
                            width: containerWidth,
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.0, color: Colors.purple),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
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
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          child: Container(
                            width: containerWidth,
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.0, color: Colors.purple),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
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
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: Container(
                          width: containerWidth,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1.0, color: Colors.purple),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
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
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: Container(
                          width: containerWidth,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1.0, color: Colors.purple),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
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
                                  ),
                                ),
                              )
                            ],
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
              SizedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: Container(
                          width: containerWidth,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1.0, color: Colors.purple),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
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
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: Container(
                          width: containerWidth,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1.0, color: Colors.purple),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
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
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
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
