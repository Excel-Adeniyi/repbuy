import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/components/otpScreen/otp.dart';
import 'package:shapmanpaypoint/helpers/colors/coloors.dart';

class ForgetPassword extends StatelessWidget {
  // const ForgetPassword({super.key});
  final _textFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _textFocus.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: GestureDetector(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(colors: [
                      Color(0xFF5423bb),
                      Color(0xFF8629b1),
                      Color(0xFFa12cab),
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
                        .createShader(bounds);
                  },
                  child: const Text(
                    'Forget Password ?',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ),
                const Text("Don't worry it happens. Please enter the"),
                const Text('email address associated with this account'),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 350,
                  height: 50,
                  child: TextField(
                    focusNode: _textFocus,
                    decoration: const InputDecoration(
                      labelText: 'Enter Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: buttongradient,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      borderRadius: BorderRadius.circular(16)),
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed('/otp');
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
