import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Screens/profile/PersonalInformation/personal_information.dart';
import 'package:shapmanpaypoint/Screens/profile/Settings/settings.dart';
import 'package:shapmanpaypoint/controller/UserInfo/user_avatar.dart';
import 'package:shapmanpaypoint/controller/UserInfo/user_info.dart';
import 'package:shapmanpaypoint/utils/width.dart';

import '../../utils/colors/coloors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = calculateContainerWidth(context);
    final userDetails = Get.find<UserInfoController>();
    final useravatar = Get.put(UserImage());

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
                  'Profile',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Next Paypoint profile gives you the freedom to'),
                const Text('manage your account information.'),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => useravatar.userImage.value.isEmpty
                          ? const CircularProgressIndicator()
                          : Image.asset(
                              useravatar.userImage.value,
                              width: 60,
                              height: 60,
                            ),
                    ),
                    Container(
                      width: 200,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: buttongradient,
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft),
                          border: Border.all(width: 1.0, color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45, // Shadow color
                              blurRadius: 5.0, // Blur radius
                              offset: Offset(0, 2),
                            )
                          ]),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Upload Photo',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Text(
                  '${userDetails.first_name.value} ${userDetails.last_name}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  overflow: TextOverflow.fade,
                ),
                Text(
                  userDetails.email.value,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.fade,
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.black,
                ),
                const Text(
                  'General Settings',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    Get.to(const PersonalInformation());
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
                        padding: EdgeInsets.only(left: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Personal Information',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text('Edit your information')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(),
                TextButton(
                  onPressed: () {
                    Get.to(const SettingsPage());
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'lib/assets/setting.png',
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
                              'Settings',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text('Account, notification')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Image.asset(
                        'lib/assets/collaboration.png',
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
                              'My Referral',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text('Referrals, Commission')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Image.asset(
                        'lib/assets/headphone.png',
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
                              'Help & Support',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text('Help, privacy & security, legal')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Image.asset(
                        'lib/assets/notice.png',
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
                              'Legal',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text('Help or contact Next Paypoint')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(),
                TextButton(
                  onPressed: () {
                    Get.offAllNamed('signin');
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'lib/assets/logout.png',
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
                              'Signout',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text('Sign out of your account')
                          ],
                        ),
                      )
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
