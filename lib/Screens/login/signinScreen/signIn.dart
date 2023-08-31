import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Screens/login/forgetPassword/forgetpassword.dart';
import 'package:shapmanpaypoint/controller/passwordtoggle.dart';

class SignIn extends StatelessWidget {
  // const SignIn({super.key});
  final FocusNode _textfocusnode = FocusNode();
  final FocusNode _textofocusnode = FocusNode();
  final _obscure = Get.put(ObscureController());
  final RxBool obscureText = true.obs;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _textfocusnode.unfocus();
        _textofocusnode.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Obx(() {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(colors: [
                        Color(0xFF5423bb),
                        Color(0xFF8629b1),
                        Color(0xFFa12cab),
                      ], begin: Alignment.topRight, end: Alignment.bottomLeft)
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
                    height: 40,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextField(
                      focusNode: _textfocusnode,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Email'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextField(
                      obscureText: _obscure.isVisible.value,
                      focusNode: _textofocusnode,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Password',
                          suffixIcon: IconButton(
                              onPressed: () {
                                _obscure.obscureToggle();
                              },
                              icon: Icon(_obscure.isVisible.value
                                  ? Icons.visibility_off
                                  : Icons.visibility))),
                    ),
                  ),
                  SizedBox(
                    width: 350,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                          onPressed: () {
                            Get.to(ForgetPassword());
                          },
                          child: const Text(
                            'forget Password ?',
                            style: TextStyle(color: Colors.grey),
                          )),
                    ),
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "New to Sharpman Paypoint?",
                        style: TextStyle(color: Color(0xFF5423bb)),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 360,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color(0xFF5423bb),
                                Color(0xFF8629b1),
                                Color(0xFFa12cab),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: TextButton(
                        onPressed: () => {},
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sign in',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 18),
                            ),
                            Icon(
                              Icons.login,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
