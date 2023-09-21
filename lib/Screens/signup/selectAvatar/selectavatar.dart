import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/helpers/width.dart';

import '../../../helpers/colors/coloors.dart';

class SelectAvatar extends StatelessWidget {
  const SelectAvatar({super.key});

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
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: containerWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Set Avatar',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Select an avatar to personalize your account"),
              SizedBox(
                height: 50,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle the selection action here, e.g., show a dialog, navigate to a new screen, etc.
                      // You can customize this onTap function to suit your needs.
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Avatar Selected',
                              textAlign: TextAlign.center,
                            ),
                            content: Image.asset(
                                'lib/assets/man1.png'), // Display the selected image
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Image.asset('lib/assets/man1.png',
                        width: 70, // Adjust the width as needed
                        height: 70 // Adjust the height as needed
                        ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle the selection action here, e.g., show a dialog, navigate to a new screen, etc.
                      // You can customize this onTap function to suit your needs.
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Avatar Selected',
                              textAlign: TextAlign.center,
                            ),
                            content: Image.asset(
                                'lib/assets/woman.png'), // Display the selected image
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Image.asset('lib/assets/woman.png',
                        width: 70, // Adjust the width as needed
                        height: 70 // Adjust the height as needed
                        ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle the selection action here, e.g., show a dialog, navigate to a new screen, etc.
                      // You can customize this onTap function to suit your needs.
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Avatar Selected',
                              textAlign: TextAlign.center,
                            ),
                            content: Image.asset(
                                'lib/assets/woman1.png'), // Display the selected image
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Image.asset(
                      'lib/assets/woman1.png',
                      width: 70, // Adjust the width as needed
                      height: 70, // Adjust the height as needed
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle the selection action here, e.g., show a dialog, navigate to a new screen, etc.
                      // You can customize this onTap function to suit your needs.
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Avatar Selected',
                              textAlign: TextAlign.center,
                            ),
                            content: Image.asset(
                                'lib/assets/man2.png'), // Display the selected image
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Image.asset('lib/assets/man2.png',
                        width: 70, // Adjust the width as needed
                        height: 70 // Adjust the height as needed
                        ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle the selection action here, e.g., show a dialog, navigate to a new screen, etc.
                      // You can customize this onTap function to suit your needs.
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Avatar Selected',
                              textAlign: TextAlign.center,
                            ),
                            content: Image.asset(
                                'lib/assets/man.png'), // Display the selected image
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Image.asset('lib/assets/man.png',
                        width: 70, // Adjust the width as needed
                        height: 70 // Adjust the height as needed
                        ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle the selection action here, e.g., show a dialog, navigate to a new screen, etc.
                      // You can customize this onTap function to suit your needs.
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Avatar Selected',
                              textAlign: TextAlign.center,
                            ),
                            content: Image.asset(
                                'lib/assets/woman2.png'), // Display the selected image
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Image.asset(
                      'lib/assets/woman2.png',
                      width: 70, // Adjust the width as needed
                      height: 70, // Adjust the height as needed
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle the selection action here, e.g., show a dialog, navigate to a new screen, etc.
                      // You can customize this onTap function to suit your needs.
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Avatar Selected',
                              textAlign: TextAlign.center,
                            ),
                            content: Image.asset(
                                'lib/assets/empathy.png'), // Display the selected image
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Image.asset('lib/assets/empathy.png',
                        width: 70, // Adjust the width as needed
                        height: 70 // Adjust the height as needed
                        ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle the selection action here, e.g., show a dialog, navigate to a new screen, etc.
                      // You can customize this onTap function to suit your needs.
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Avatar Selected',
                              textAlign: TextAlign.center,
                            ),
                            content: Image.asset(
                                'lib/assets/rabbit.png'), // Display the selected image
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Image.asset('lib/assets/rabbit.png',
                        width: 70, // Adjust the width as needed
                        height: 70 // Adjust the height as needed
                        ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle the selection action here, e.g., show a dialog, navigate to a new screen, etc.
                      // You can customize this onTap function to suit your needs.
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Avatar Selected',
                              textAlign: TextAlign.center,
                            ),
                            content: Image.asset(
                                'lib/assets/bear.png'), // Display the selected image
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Image.asset(
                      'lib/assets/bear.png',
                      width: 70, // Adjust the width as needed
                      height: 70, // Adjust the height as needed
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle the selection action here, e.g., show a dialog, navigate to a new screen, etc.
                      // You can customize this onTap function to suit your needs.
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Avatar Selected',
                              textAlign: TextAlign.center,
                            ),
                            content: Image.asset(
                                'lib/assets/woman.png'), // Display the selected image
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Image.asset('lib/assets/woman.png',
                        width: 70, // Adjust the width as needed
                        height: 70 // Adjust the height as needed
                        ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle the selection action here, e.g., show a dialog, navigate to a new screen, etc.
                      // You can customize this onTap function to suit your needs.
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Avatar Selected',
                              textAlign: TextAlign.center,
                            ),
                            content: Image.asset(
                                'lib/assets/man.png'), // Display the selected image
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Image.asset('lib/assets/man.png',
                        width: 70, // Adjust the width as needed
                        height: 70 // Adjust the height as needed
                        ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle the selection action here, e.g., show a dialog, navigate to a new screen, etc.
                      // You can customize this onTap function to suit your needs.
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Avatar Selected',
                              textAlign: TextAlign.center,
                            ),
                            content: Image.asset(
                                'lib/assets/bear.png'), // Display the selected image
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Image.asset(
                      'lib/assets/bear.png',
                      width: 70, // Adjust the width as needed
                      height: 70, // Adjust the height as needed
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              Container(
                width: containerWidth,
                height: 40,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45, // Shadow color
                        blurRadius: 5.0, // Blur radius
                        offset: Offset(0, 2),
                      )
                    ],
                    border: Border.all(
                        color: const Color.fromARGB(255, 219, 218, 218),
                        width: 2.0),
                    gradient: LinearGradient(
                        colors: buttongradient,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                    borderRadius: BorderRadius.circular(16)),
                child: TextButton(
                  onPressed: () {
                    Get.toNamed('/dashboard');
                  },
                  child: Text(
                    'Continue',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
