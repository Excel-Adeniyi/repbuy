import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/master_controller/master_controller.dart';
import 'package:shapmanpaypoint/services/GoogleService/google_signin.dart';
import 'package:shapmanpaypoint/utils/width.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MasterController());
    final googleSign = GoogleService();
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              width: calculateContainerWidth(context),
              height: screenHeight * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'lib/assets/NEXTELLAR1a.png',
                    width: 200,
                    height: 100,
                  ),
                  const Text(
                    'Enjoy awesome features for your Airtime, Data top up and utility bill payment with a single click.',
                    softWrap: true,
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    width: calculateContainerWidth(context),
                    height: 230.0,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(18.0)),
                        gradient: LinearGradient(
                            colors: [
                              Color(0xfff7f6bb),
                              Color(0xfffcdc2a),
                              Color(0xff87a922),
                              Color(0xff0a2417),
                              Color.fromARGB(255, 13, 71, 42),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            transform: GradientRotation(120))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                          child: TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white),
                                fixedSize: WidgetStateProperty.all(Size(
                                    calculateContainerWidth(context), 10.0))),
                            onPressed: () => {Get.toNamed('/signin')},
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Sign in',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Icon(Icons.login)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                          child: TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.white),
                                fixedSize: WidgetStateProperty.all(Size(
                                    calculateContainerWidth(context), 10.0))),
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
      ),
    );
  }
}
