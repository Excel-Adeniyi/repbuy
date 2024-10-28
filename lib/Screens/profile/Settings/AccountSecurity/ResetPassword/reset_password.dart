import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/Auth/change_password_controller.dart';
import 'package:shapmanpaypoint/utils/width.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    FocusNode currentPassword = FocusNode();
    FocusNode newPassword = FocusNode();
    FocusNode confirmNewPassword = FocusNode();
    ChangePasswordController changePasswordController =
        Get.put(ChangePasswordController());
    return Scaffold(
      body: Obx(
        () => SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              currentPassword.unfocus();
              newPassword.unfocus();
              confirmNewPassword.unfocus();
            },
            child: Center(
              child: SizedBox(
                width: calculateContainerWidth(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Change Password',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const Text(
                      'REPBUY profile gives you the freedom to manage your account information',
                      overflow: TextOverflow.clip,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text('Current Password',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold)),
                    TextField(
                      focusNode: currentPassword,
                      obscureText:
                          changePasswordController.showCurrentPassword.value,
                      // controller: ,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          suffix: TextButton(
                            onPressed: () {},
                            child: changePasswordController
                                    .showCurrentPassword.isTrue
                                ? const Icon(
                                    Icons.visibility,
                                    color: Colors.black,
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                          ),
                          contentPadding: const EdgeInsets.only(
                            left: 15.0,
                            right: 15.0,
                          )),
                      onChanged: (String newvalue) {},
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('New Password',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold)),
                    TextField(
                      focusNode: newPassword,
                      obscureText: true,
                      // controller: ,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.only(
                            left: 15.0,
                            right: 15.0,
                          )),
                      onChanged: (String newvalue) {},
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('Confirm New Password',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold)),
                    TextField(
                      focusNode: confirmNewPassword,
                      obscureText: true,
                      // controller: ,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.only(
                            left: 15.0,
                            right: 15.0,
                          )),
                      onChanged: (String newvalue) {},
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
