import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Model/Auth/signinModel.dart';
import 'package:shapmanpaypoint/Screens/login/forgetPassword/forgetpassword.dart';
import 'package:shapmanpaypoint/controller/Auth/signin_controller.dart';
import 'package:shapmanpaypoint/controller/passwordtoggle.dart';
import 'package:shapmanpaypoint/services/loginService.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';

class SignIn extends StatelessWidget {
  // const SignIn({super.key});
  final FocusNode _textfocusnode = FocusNode();
  final FocusNode _textofocusnode = FocusNode();
  // final _obscure = Get.put(ObscureController());
  final RxBool obscureText = true.obs;
  final _obscure = Get.find<ObscureController>();
  final SignInController signincontroller = Get.put(SignInController());

  final TextEditingController _userData = TextEditingController();
  // final TextEditingController phone_number = TextEditingController();
  final TextEditingController _passWord = TextEditingController();

  // signIn service
  final SigninService signservice = SigninService();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double containerWidth;

    if (screenWidth < 600) {
      containerWidth = 300.0;
    } else if (screenWidth < 1200) {
      containerWidth = 400.0;
    } else {
      containerWidth = 500.0;
    }
    return GestureDetector(
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
                      width: containerWidth,
                      height: 50,
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
                      width: containerWidth,
                      height: 50,
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
                      width: containerWidth,
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
                      height: 100,
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
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: containerWidth,
                        height: 35,
                        decoration: const BoxDecoration(
                            boxShadow: [BoxShadow(color: Colors.black45)],
                            gradient: LinearGradient(
                                colors: buttongradient,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: TextButton(onPressed: () {
                          final user = User(
                              userdata: _userData.text,
                              password: _passWord.text);
                          signservice.userLogin(user);
                        }, child: Obx(() {
                          if (signincontroller.isLoading.value == true) {
                            print("HI");
                            return const CircularProgressIndicator();
                          } else {
                            if (signincontroller.isLoggedIn.value == true) {
                              // Get.toNamed('dashboard');
                              print("HI");
                              return Container();
                            } else {
                              return const Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Sign in',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 15),
                                  ),
                                  Icon(
                                    Icons.login,
                                    color: Colors.white,
                                  ),
                                ],
                              );
                            }
                          }
                        })),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
