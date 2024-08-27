import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/Auth/signin_controller.dart';
import 'package:shapmanpaypoint/controller/UserInfo/user_info.dart';

class AuthMiddleWare extends GetMiddleware {
  UserInfoController userInfo = Get.put(UserInfoController());
  SignInController signIn = Get.put(SignInController());
  @override
  RouteSettings? redirect(String? route) {
    // signIn.isLoggedIn.value = false;
    bool loggedIN = signIn.isLoggedIn.value;

    int expireInfo = userInfo.exp.value;
    DateTime convertTime =
        DateTime.fromMillisecondsSinceEpoch(expireInfo * 1000);
    print('CONVERT TIME $convertTime');
    bool isExpired = DateTime.now().isAfter(convertTime);
    print("EXPIRED BOOL $isExpired");
    if (!loggedIN || isExpired) {
      return const RouteSettings(name: '/dashboard');
    }
    return null;
  }
}
