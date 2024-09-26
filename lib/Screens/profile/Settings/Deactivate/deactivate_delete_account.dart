import 'package:flutter/material.dart';
import 'package:shapmanpaypoint/utils/responsiveness/buttonWidth.dart';
import 'package:shapmanpaypoint/utils/width.dart';

class DeactivateDeleteAccount extends StatelessWidget {
  const DeactivateDeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = calculateContainerWidth(context);
    final screenhight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: screenSize,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Delete/Deactivate Account',
                  overflow: TextOverflow.fade,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                    'Nexttellar profile gives you the freedom to manage your account information',
                    overflow: TextOverflow.clip),
                const SizedBox(
                  height: 100,
                ),
                SizedBox(
                  height: screenhight * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Image.asset(
                          'lib/assets/deletebin.png',
                        ),
                      ),
                      const Column(
                        children: [
                          Center(
                            child: Text(
                              'Delete/Deactivate Account',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              'Are you sure you want to delete/deactivate your account ?',
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Center(
                            child: Text('This action can not be undone.'),
                          ),
                        ],
                      ),
                      Container(
                        width: calculateButtonWidth(context),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Delete Account',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
