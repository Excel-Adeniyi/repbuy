import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/TransactionList/transaction_list_controller.dart';
import 'package:shapmanpaypoint/services/TransactionList/transaction_list.dart';
import 'package:shapmanpaypoint/utils/flutter_storage/flutter_storage.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class UtilityStatusSocket extends GetxController {
  // RxString userId = ''.obs;
  RxString message = ''.obs;
  final WebSocketChannel channel =
      IOWebSocketChannel.connect('ws://172.23.104.230:2110');
  final SecureStorage stora = SecureStorage();
  final TransactionList translist = TransactionList();
  final translistController = Get.put(TransactionListController());

  @override
  void onInit() {
    super.onInit();
    // _setupFCM();
    _setupWebSocket();
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Future<void> _setupWebSocket() async {
    final readData = await stora.readSecureData("ResBody");
    Map<String, dynamic> decodedJson = json.decode(readData);
    final userId = decodedJson['id'].toString();
    const type = "register";
    final data = jsonEncode({'userId': userId, 'type': type});
    channel.sink.add(data);
    channel.stream.listen((data) {
      message.value = data;
      print("WEBSO $data");
      final converted = json.decode(data);
      print("THE CONVERTED DATA $converted");
      _showNotification(converted);
      translistController.fetchTransactionList();
      Get.snackbar('WebSocket Message', data,
          titleText: const Text('New Message ()'),
          snackPosition: SnackPosition.TOP);
    }, onError: (error) {
      // Handle any errors that occur during the listening
      print('WebSocket error: $error');
    }, onDone: () {
      // Handle the WebSocket connection being closed
      print('WebSocket connection closed');
    });
  }

  void _showNotification(List<dynamic> message) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      channelDescription: 'This channel is used for important notifications.',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
      icon: '@mipmap/ic_launcher',
    );
    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    final idMSG = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    message.asMap().forEach((index, dynamic messages) async {
      final messsageUnit = messages['pin_number'].toString();
      await flutterLocalNotificationsPlugin.show(
        idMSG + index,
        'New Message ${index + 1}',
        messages['type'] != null
            ? "  ${messages['type']} 👍"
            : "You have a new message ❗ ",
        platformChannelSpecifics,
        payload: messages['type'] = 'item x',
      );
    });
  }

  // @override
  // void onClose() {
  //   channel.sink.close();
  //   super.onClose();
  // }
}
