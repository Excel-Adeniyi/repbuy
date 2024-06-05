import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Screens/login/signinScreen/login_button.dart';
import 'package:shapmanpaypoint/controller/Auth/auth_int.dart';
import 'package:shapmanpaypoint/controller/Auth/signin_controller.dart';
import 'package:shapmanpaypoint/controller/passwordtoggle.dart';
import 'package:shapmanpaypoint/utils/width.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class SignIn extends StatelessWidget {
  // const SignIn({super.key});
  final FocusNode _textfocusnode = FocusNode();
  final FocusNode _textofocusnode = FocusNode();
  // final _obscure = Get.put(ObscureController());

  final RxBool obscureText = true.obs;
  final _obscure = Get.find<ObscureController>();
  final SignInController signincontroller = Get.put(SignInController());
  final csrfINIT = Get.put(CSRFINIT());
  final TextEditingController _userData = TextEditingController();
  // final TextEditingController phone_number = TextEditingController();
  final TextEditingController _passWord = TextEditingController();

  // signIn service

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      backgroundColor: const Color.fromARGB(255, 101, 21, 116),
      indicatorWidget:
          Column(
            children: [
              Image.asset("lib/assets/logo.png", width: 30, height: 30),
              const SizedBox(height: 10,),
              const Text("Loading", style: TextStyle(color: Colors.white, fontSize: 12, decoration: TextDecoration.none),)
            ],
          ),
      child: GestureDetector(
        onTap: () {
          _textfocusnode.unfocus();
          _textofocusnode.unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: SingleChildScrollView(
                child: Obx(() {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                                  colors: [
                                Color(0xFF5423bb),
                                Color(0xFF8629b1),
                                Color(0xFFa12cab),
                              ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)
                              .createShader(bounds);
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      SizedBox(
                        width: calculateContainerWidth(context),
                        child: TextField(
                          focusNode: _textfocusnode,
                          style: const TextStyle(fontSize: 13),
                          controller: _userData,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter Email/Phone number'),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: calculateContainerWidth(context),
                        child: TextField(
                          obscureText: _obscure.isVisible.value,
                          controller: _passWord,
                          focusNode: _textofocusnode,
                          style: const TextStyle(fontSize: 13),
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.0)),
                              ),
                              labelText: 'Enter Password',
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    _obscure.obscureToggle();
                                  },
                                  icon: Icon(
                                    _obscure.isVisible.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    size: 16,
                                  ))),
                        ),
                      ),
                      SizedBox(
                        width: calculateContainerWidth(context),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                              onPressed: () {
                                Get.toNamed('/forgetpassword');
                              },
                              child: const Text(
                                'forget Password ?',
                                style: TextStyle(color: Colors.grey),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "New to Next Paypoint?",
                            style: TextStyle(color: Color(0xFF5423bb)),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.toNamed('/signup');
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      LoginButton(
                        userData: _userData.text,
                        passWord: _passWord.text,
                        withIcon: 'yes',
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
