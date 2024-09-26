import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Screens/profile/Settings/AccountSecurity/account_security.dart';
import 'package:shapmanpaypoint/Screens/profile/Settings/Deactivate/deactivate_delete_account.dart';
import 'package:shapmanpaypoint/Screens/profile/Settings/Notification/notification.dart';
import 'package:shapmanpaypoint/utils/width.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = calculateContainerWidth(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: screenSize,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                    'Nexttellar profile gives you the freedom to manage your account information',
                    overflow: TextOverflow.clip),
                const SizedBox(
                  height: 50,
                ),
                TextButton(
                  onPressed: () {
                    Get.to(const AccountSecurity());
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'lib/assets/edit.png',
                        width: 40,
                        color: const Color(0xff0a2417).withOpacity(0.9),
                        colorBlendMode: BlendMode.modulate,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Account Security',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text(
                              'Reset Password, Biometrics',
                              style: TextStyle(fontSize: 13),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(),
                TextButton(
                  onPressed: () {
                    Get.to(const NotificationScreen());
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Icons.add_alert,
                        color: Colors.black,
                        size: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Notification',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text(
                              'Push, Email Notification',
                              style: TextStyle(fontSize: 13),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(),
                TextButton(
                  onPressed: () {
                    Get.to(const DeactivateDeleteAccount());
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Icons.restore_from_trash_rounded,
                        color: Colors.black,
                        size: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Deactivate/Delete Account',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text(
                              'Account Deactivation, Account Deletion',
                              style: TextStyle(fontSize: 13),
                            )
                          ],
                        ),
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
