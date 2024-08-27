import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Model/Auth/signinModel.dart';
import 'package:shapmanpaypoint/controller/Auth/signin_controller.dart';
import 'package:shapmanpaypoint/controller/Effects/on_tap.dart';
import 'package:shapmanpaypoint/services/loginService.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';
import 'package:shapmanpaypoint/utils/responsiveness/buttonWidth.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class LoginButton extends StatelessWidget {
  final String userData;
  final String passWord;
  final String withIcon;

  const LoginButton(
      {super.key,
      required this.userData,
      required this.passWord,
      required this.withIcon});

  @override
  Widget build(BuildContext context) {
    final SigninService signservice = SigninService();
    final SignInController signincontroller = Get.put(SignInController());
    final ontapEffectController = Get.put(OnTapEffect());
    return Obx(() => AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          // margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
          height: 50,
          width: calculateButtonWidth(context),
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black45, // Shadow color
                  blurRadius: 5.0, // Blur radius
                  offset: Offset(0, 2),
                )
              ],
              border: Border.all(
                  color: const Color.fromARGB(255, 219, 218, 218), width: 1.0),
              gradient: LinearGradient(
                  colors: ontapEffectController.isTapped.value
                      ? isbuttongradient
                      : buttongradient,
                  begin: Alignment.bottomRight,
                  end: Alignment.topCenter),
              borderRadius: BorderRadius.circular(10)),
          child: Obx(() {
            print(signincontroller.isLoading.value);
            final loadingCheck = signincontroller.isLoading.value;
            print("CHCKING THE LOAD $loadingCheck");
            return TextButton(
                onPressed: () {
                  ontapEffectController.isTapped.value = true;
                  Future.delayed(const Duration(milliseconds: 600), () {
                    ontapEffectController.isTapped.value = false;
                    // print("WORKING");
                    // verifyOtpService.verifyOTP(title);
                    final user = User(userdata: userData, password: passWord);
                    signservice.userLogin(user);
                    final progress = ProgressHUD.of(context);

                    if (signincontroller.isLoading.value == true) {
                      print("PROGRESS SHOW");
                      progress?.show();
                      Future.delayed(const Duration(seconds: 3),
                          () => progress?.dismiss());
                    }
                  });
                  // Get.toNamed('/dashboard');
                },
                child: ontapEffectController.isTapped.value == true
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : withIcon == "yes"
                        ? const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "SignIn",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.login,
                                color: Colors.white,
                              )
                            ],
                          )
                        : const Text(
                            "SignIn",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ));
          }),
        ));
  }
}
