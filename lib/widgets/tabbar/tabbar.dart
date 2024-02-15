// ignore_for_file: unnecessary_import, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Screens/dashboard/Tabs/Dashboardtab/Dashboardtab.dart';

import '../../controller/tabcontroller.dart';

class Dashboard extends StatelessWidget {
  // final TabIndexController _controller = Get.put(TabIndexController());
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double containerHeight;
    if (screenHeight < 480) {
      containerHeight = 700;
    } else if (screenHeight < 900) {
      containerHeight = 700;
    } else {
      containerHeight = 1300;
    }
    double containerWidth;
    if (screenWidth < 600) {
      containerWidth = 300.0;
    } else if (screenWidth < 1200) {
      containerWidth = 400.0;
    } else {
      containerWidth = 500.0;
    }
    return SingleChildScrollView(
        child: DashboardTab(containerWidth: containerWidth));
  }
}
