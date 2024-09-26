import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class IdleMiddleware extends GetMiddleware {
  // Timer? _idleTimer;

  static const int idleDurationMilliseconds = 1000000;
  late Timer _idleTimer;

  IdleMiddleware() {
    startIdleTimer();
  }

  @override
  RouteSettings? redirect(String? route) {
    resetIdleTimer();
    return null;
  }

  void startIdleTimer() {
    print("CHECKER STARTER");
    _idleTimer =
        Timer(const Duration(milliseconds: idleDurationMilliseconds), () {
      Get.offNamed('/signin');
    });
  }

  void resetIdleTimer() {
    _idleTimer.cancel();
    startIdleTimer();
  }
}
