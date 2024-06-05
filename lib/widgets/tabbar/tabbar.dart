// ignore_for_file: unnecessary_import, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Screens/dashboard/Tabs/Dashboardtab/dashboard_tab.dart';
import 'package:shapmanpaypoint/utils/width.dart';

import '../../controller/tabcontroller.dart';

class Dashboard extends StatelessWidget {
  // final TabIndexController _controller = Get.put(TabIndexController());
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double containerHeight;
    if (screenHeight < 480) {
      containerHeight = calculateContainerWidth(context);
    } else if (screenHeight < 900) {
      containerHeight = calculateContainerWidth(context);
    } else {
      containerHeight = calculateContainerWidth(context);
    }
    double containerWidth;
    if (screenWidth < 600) {
      containerWidth = calculateContainerWidth(context);
    } else if (screenWidth < 1200) {
      containerWidth = calculateContainerWidth(context);
    } else {
      containerWidth = calculateContainerWidth(context);
    }
    return SingleChildScrollView(
        child: DashboardTab(containerWidth: containerWidth));
  }
}
