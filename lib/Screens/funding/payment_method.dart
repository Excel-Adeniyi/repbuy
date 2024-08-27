import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/UserInfo/user_avatar.dart';
import 'package:shapmanpaypoint/controller/UserInfo/user_info.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';
import 'package:shapmanpaypoint/utils/responsiveness/buttonWidth.dart';
import 'package:shapmanpaypoint/utils/width.dart';
import 'package:shapmanpaypoint/widgets/button/gradient_button.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = calculateContainerWidth(context);
    final buttonSize = calculateButtonWidth(context);
    final useravatar = Get.put(UserImage());
    final userDetails = Get.find<UserInfoController>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: screenSize,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                      child: Obx(
                        () => useravatar.userImage.value.isEmpty
                            ? const CircularProgressIndicator()
                            : Image.asset(
                                useravatar.userImage.value,
                                width: 60,
                                height: 60,
                              ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        'Welcome, ${userDetails.first_name.value} ${userDetails.last_name}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Image.asset(
                      'lib/assets/NEXTELLAR1c.png',
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
                  imagedata: 'lib/assets/creditCard.png',
                  assetName: 'Add Money Via Card',
                  pageRoute: 'banktransfer',
                ),
                const Opacity(
                  opacity: 0.8,
                  child: GradientButton(
                      imagedata: 'lib/assets/mtf.png',
                      assetName: 'Bank Transfer',
                      pageRoute: ""),
                ),
                const Opacity(
                  opacity: 0.8,
                  child: GradientButton(
                    imagedata: 'lib/assets/creditCard.png',
                    assetName: 'Add Bank Card',
                    pageRoute: '',
                  ),
                ),
                const Opacity(
                  opacity: 0.8,
                  child: GradientButton(
                    imagedata: 'lib/assets/wallet10.png',
                    assetName: 'Bitcoin',
                    pageRoute: '',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 0, 18.0, 0),
                  child: Container(
                      width: buttonSize,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          gradient: LinearGradient(colors: buttongradient)),
                      child: TextButton(
                        onPressed: () {
                          Get.offNamed('dashboard');
                        },
                        child: const Text(
                          "Back",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
