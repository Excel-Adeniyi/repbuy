// ignore_for_file: file_names, use_key_in_widget_constructors, unrelated_type_equality_checks, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/serviceScreen.dart';
import 'package:shapmanpaypoint/Screens/walletscreen/walletscreen.dart';
import '../../controller/tabcontroller.dart';
import '../bottomNav/buildTab.dart';
import '../tabbar/tabbar.dart';

class LayoutScreen extends StatelessWidget {
  // const Dashboard({super.key});
  final TabbController control = Get.put(TabbController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Obx(() {
            switch (control.selectedTab.value) {
              case 0:
                return Dashboard();
              case 1:
                return ServiceScreen();
              case 2:
                return WalletScreen();

              default:
                return Dashboard();
            }
          }),
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Padding(
            padding: EdgeInsets.all(0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BuildTab(
                    index: 0,
                    imageAsset: 'lib/assets/delete.png',
                    title: 'Dashboard',
                    focuss: control.focus1,
                    onClick: () => control.toggleFocus(0)),
                BuildTab(
                    index: 1,
                    imageAsset: 'lib/assets/gift-box.png',
                    title: 'Services',
                    focuss: control.focus2,
                    onClick: () => control.toggleFocus(1)),
                BuildTab(
                    index: 2,
                    imageAsset: 'lib/assets/wallet1.png',
                    title: 'Wallet',
                    focuss: control.focus3,
                    onClick: () => control.toggleFocus(2)),
                BuildTab(
                    index: 3,
                    imageAsset: 'lib/assets/edit.png',
                    title: 'Profile',
                    focuss: control.focus4,
                    onClick: () => Get.toNamed('profile')),
              ],
            ),
          )),
    );
  }
}
