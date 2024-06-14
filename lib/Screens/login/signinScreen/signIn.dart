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
    return SafeArea(
      child: ProgressHUD(
        barrierColor: Colors.black45,
        indicatorWidget:  SizedBox(width: 100, height: 100, child: FittedBox(child: Image.asset("lib/assets/NEXTELLAR1c.png"))),
        child: GestureDetector(
          onTap: () {
            _textfocusnode.unfocus();
            _textofocusnode.unfocus();
          },
          child: Scaffold(
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
                                  Color(0xfffcdc2a),
                                  Color(0xff87a922),
                                  Color(0xff0a2417),
                                ],
                                    begin: Alignment.bottomRight,
                                    end: Alignment.topLeft)
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
                                focusColor: Colors.black54,
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xfffcdc2a))),
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
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xfffcdc2a))),
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
                              style: TextStyle(
                                  color: Color.fromARGB(255, 12, 24, 10)),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.toNamed('/signup');
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 12, 24, 10)),
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
      ),
    );
  }
}
