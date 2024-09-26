import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/notification_controller.dart';
import 'package:shapmanpaypoint/utils/width.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = calculateContainerWidth(context);
    final PushNotificationController nController =
        Get.put(PushNotificationController());
    return Scaffold(
      body: Obx(
        () => SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: screenSize,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Notification',
                    overflow: TextOverflow.fade,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Never miss a thing with our push notification',
                      overflow: TextOverflow.clip),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            const Icon(
                              Icons.add_alert,
                              color: Colors.black,
                              size: 40,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Push Notification',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    'Disable & Enable Push Notification',
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                            Switch(
                                activeColor: Colors.green,
                                activeTrackColor: Colors.lightGreenAccent,
                                inactiveThumbColor: Colors.black54,
                                inactiveTrackColor: Colors.grey,
                                value: nController.pushNotification.value,
                                onChanged: (value) {
                                  nController.pushNotification.value = value;
                                })
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
