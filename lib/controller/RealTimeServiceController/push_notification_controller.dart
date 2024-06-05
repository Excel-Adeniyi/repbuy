import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/services/RealTimeConnection/fcm_token.dart';
import 'package:shapmanpaypoint/utils/flutter_storage/flutter_storage.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class NotificationController extends GetxController {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
 
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  final fcmtokensender = FCMTokenSender();
  @override
  void onInit() {
    super.onInit();
    _setupFCM();
    // _setupWebSocket();
  }

  void _setupFCM() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            const NotificationDetails(
                android: AndroidNotificationDetails(
              'high_importance_channel',
              'High Importance Notifications',
              channelDescription:
                  'This channel is used for important notifications.',
              icon: 'launch_background',
            )));
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      Get.defaultDialog(
        title: notification?.title ?? '',
        middleText: notification?.body ?? '',
      );
    });

    _firebaseMessaging.getToken().then((String? token) {
      if (token != null) {
        // print(token);
        print("HEY");
        fcmtokensender.tokenToBackend(token);
      }
    }).catchError((error) {
      print("Error getting FCM token: $error");
    });
  }

  
}
