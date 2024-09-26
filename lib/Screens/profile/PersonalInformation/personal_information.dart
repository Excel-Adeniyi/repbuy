import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/Effects/on_tap.dart';
import 'package:shapmanpaypoint/controller/UserInfo/user_info.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';
import 'package:shapmanpaypoint/utils/responsiveness/buttonWidth.dart';
import 'package:shapmanpaypoint/utils/width.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    FocusNode pName = FocusNode();
    FocusNode pPhone = FocusNode();
    FocusNode pEmail = FocusNode();
    final screenSize = calculateContainerWidth(context);
    TextEditingController names = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController email = TextEditingController();
    final userDetails = Get.find<UserInfoController>();
    names.text =
        '${userDetails.first_name.value} ${userDetails.last_name.value}';
    phone.text = userDetails.phone.value;
    email.text = userDetails.email.value;
    final ontapEffectController = Get.put(OnTapEffect());
    return Scaffold(
      body: Obx(
        () => SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: GestureDetector(
            onTap: () {
              pEmail.unfocus();
              pPhone.unfocus();
              pName.unfocus();
            },
            child: Center(
              child: SizedBox(
                width: screenSize,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Text(
                      'Nexttellar gives you the freedom to manage your account information',
                      overflow: TextOverflow.clip,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextField(
                            focusNode: pName,
                            controller: names,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Firstname, Lastname',
                            ),
                            onChanged: (String name) {},
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            controller: phone,
                            focusNode: pPhone,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Phone number',
                            ),
                            onChanged: (String phone) {},
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            controller: email,
                            focusNode: pEmail,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                            ),
                            onChanged: (String email) {},
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      // margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                      height: 50,
                      width: calculateButtonWidth(context),
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
                              width: 1.0),
                          gradient: LinearGradient(
                              colors: ontapEffectController.isTapped.value
                                  ? isbuttongradient
                                  : buttongradient,
                              begin: Alignment.bottomRight,
                              end: Alignment.topCenter),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Update',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
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
