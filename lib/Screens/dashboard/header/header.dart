import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shapmanpaypoint/controller/AdditionalDetailsController/balance_controller.dart';
// import 'package:shapmanpaypoint/controller/Auth/useravatar_controller.dart';
import 'package:shapmanpaypoint/controller/UserInfo/user_avatar.dart';
import 'package:shapmanpaypoint/controller/UserInfo/user_info.dart';
import 'package:shapmanpaypoint/controller/master_controller/master_controller.dart';
import 'package:shapmanpaypoint/controller/passwordtoggle.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';
// import 'package:shapmanpaypoint/utils/flutter_storage/flutter_storage.dart';

class DashboardHeader extends StatelessWidget {
  // const DashboardHeader({super.key});
  final BalanceObscure _controller = Get.put(BalanceObscure());
  final MasterController masterController = Get.put(MasterController());
  final _userDetails = Get.find<UserInfoController>();
  final _useravatar = Get.put(UserImage());
  final BalanceController balanceController = Get.put(BalanceController());
  final NumberFormat numberFormat = NumberFormat('#,##0.00', 'en_us');

  DashboardHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (_) async {
        Get.toNamed("dashboard");
        // Return false to prevent the default back button behavior
      },
      canPop: false,
      child: SingleChildScrollView(
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
                    child: Obx(
                      () => _useravatar.userImage.value.isEmpty
                          ? const CircularProgressIndicator()
                          : Image.asset(
                              _useravatar.userImage.value,
                              width: 60,
                              height: 60,
                            ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      'Welcome, ${_userDetails.first_name.value} ${_userDetails.last_name}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(100)),
                    child:
                        Image.asset('lib/assets/3.png', width: 60, height: 60),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(
                      colors: dashboardgradient,
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
                              child: Obx(() {
                                final balancee =
                                    balanceController.numberformat();
                                return Text(
                                  _controller.hideText == false
                                      ? "******"
                                      : 'NGN $balancee',
                                  style: const TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                );
                              }),
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
      ),
    );
  }
}
