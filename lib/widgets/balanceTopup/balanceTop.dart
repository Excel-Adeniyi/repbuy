import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/Animation/shimmer_controller.dart';

import '../../controller/passwordtoggle.dart';
import '../../utils/colors/coloors.dart';

class TopBalance extends StatelessWidget {
  // const TopBalance({super.key});
  final BalanceObscure _controller = Get.find<BalanceObscure>();
  final _shimmerController = Get.put(ShimmerEffect());
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _shimmerController.animationController,
        builder: ((context, child) => Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                  colors: buttongradient,
                  begin: Alignment(
                      0, -1 - _shimmerController.animationController.value),
                  end: Alignment(
                      0, 1 + _shimmerController.animationController.value)),
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
                                style: const TextStyle(
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
                const SizedBox(
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
                        onPressed: () {},
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
            ))));
  }
}
