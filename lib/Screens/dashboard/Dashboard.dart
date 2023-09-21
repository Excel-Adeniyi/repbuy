import 'package:flutter/material.dart';
import 'package:shapmanpaypoint/Screens/Dashboard/Header/header.dart';
import 'package:shapmanpaypoint/components/tabbar/tabbar.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        DashboardHeader(),
        Tabbar(),
      ]),
    );
  }
}
