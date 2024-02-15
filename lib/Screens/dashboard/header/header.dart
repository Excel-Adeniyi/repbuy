import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/passwordtoggle.dart';

import 'package:shapmanpaypoint/utils/colors/coloors.dart';

class DashboardHeader extends StatelessWidget {
  // const DashboardHeader({super.key});
  final BalanceObscure _controller = Get.put(BalanceObscure());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                    colors: buttongradient,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                            child: Obx(() => Text(
                                  _controller.hideText == false
                                      ? "******"
                                      : 'NGN 10,000',
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            _controller.hideToggle();
                          },
                          child: Obx(
                            () => Icon(
                                color: Colors.white,
                                _controller.hideText == false
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                          ),
                        ),
                      ]),
                  const Text(
                    'Wallet Balance',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45, // Shadow color
                              blurRadius: 5.0, // Blur radius
                              offset: Offset(0, 2),
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: TextButton(
                          onPressed: () {
                            Get.toNamed('funding');
                          },
                          child: const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Fund Wallet',
                                style: TextStyle(color: Colors.black),
                              ),
                              Icon(
                                Icons.add,
                                color: Colors.black,
                              )
                            ],
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
