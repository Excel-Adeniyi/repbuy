import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/master_controller/master_controller.dart';
import 'package:shapmanpaypoint/services/GoogleService/google_signin.dart';
import 'package:shapmanpaypoint/services/token.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MasterController());
    final googleSign = GoogleService();
    final csrfService = CsrfService();
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(24.0),
        // width: 500,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/assets/logo.png',
                  width: 300,
                  height: 150,
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Welcome to Next',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Paypoint',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 13,
                ),
                const Text('Enjoy awesome features for your Airtime,'),
                const Text('Data top up and utility bill payment with a '),
                const Text('single click'),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: 370.0,
                  height: 230.0,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      gradient: LinearGradient(
                          colors: [
                            Color(0xFF5423bb),
                            Color(0xFF8629b1),
                            Color.fromARGB(255, 255, 4, 180),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          transform: GradientRotation(120))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            fixedSize: MaterialStateProperty.all(
                                const Size(200.0, 10.0))),
                        onPressed: () =>
                            {Get.toNamed('/signin'), csrfService.get()},
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sign in',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.login)
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            fixedSize: MaterialStateProperty.all(
                                const Size(200.0, 10.0))),
                        onPressed: () => {googleSign.googleAuth()},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('lib/assets/googlelogo.png'),
                            const Text(
                              'Sign in with Google',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.toNamed('/signup');
                              },
                              child: const Text(
                                'Register Now',
                                style: TextStyle(color: Colors.white),
                              ))
                        ],
                      )
                    ],
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
