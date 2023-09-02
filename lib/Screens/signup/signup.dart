import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Screens/login/signinScreen/signIn.dart';
import 'package:shapmanpaypoint/Screens/signup/completionScreen/completionScreen.dart';
import 'package:shapmanpaypoint/controller/dropdownController.dart';
import 'package:shapmanpaypoint/controller/passwordtoggle.dart';
import 'package:shapmanpaypoint/helpers/countries/countries.dart';
import 'package:shapmanpaypoint/helpers/responsiveness/responsiveness.dart';

import '../../helpers/colors/coloors.dart';

class SignupScreen extends StatelessWidget {
  final _obscurer = Get.find<PasswordController>();
  final _firstnamefocus = FocusNode();
  final _secondnamefocus = FocusNode();
  final _emailfocus = FocusNode();
  final _phonefocus = FocusNode();
  final _passwordfocus = FocusNode();
  final _confirmpasswordfocus = FocusNode();
  final DropdownController controller = Get.put(DropdownController());

  List<String> options = country_list;
  @override
  Widget build(BuildContext context) {
    double containerWidth = ScreenWidth.calculateContainerWidth(context);
    return GestureDetector(
      onTap: () {
        _firstnamefocus.unfocus();
        _secondnamefocus.unfocus();
        _emailfocus.unfocus();
        _phonefocus.unfocus();
        _passwordfocus.unfocus();
        _confirmpasswordfocus.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Obx(
              () {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text('Sign Up'),
                    TextButton(
                      style: ButtonStyle(
                          shadowColor:
                              MaterialStateProperty.all(Colors.black54),
                          elevation: MaterialStateProperty.all(8),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          fixedSize: MaterialStateProperty.all(
                              const Size(200.0, 10.0))),
                      onPressed: () => {},
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'lib/assets/googlelogo.png',
                            width: 40,
                          ),
                          const Text(
                            'Sign in with Google',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text('or'),
                        ),
                        Expanded(child: Divider())
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: containerWidth,
                      height: 50,
                      child: TextField(
                        focusNode: _firstnamefocus,
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 14),
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                            label: Text(
                              'First name',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 14),
                            ),
                            hintText: 'enter your last first name',
                            border: OutlineInputBorder()),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      width: containerWidth,
                      height: 50,
                      child: TextField(
                        focusNode: _secondnamefocus,
                        keyboardType: TextInputType.name,
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 14),
                        decoration: const InputDecoration(
                            label: Text(
                              'Last name',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 14),
                            ),
                            hintText: 'enter your last name',
                            border: OutlineInputBorder()),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      width: containerWidth,
                      height: 50,
                      child: TextField(
                        focusNode: _emailfocus,
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 14),
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            label: Text(
                              'Email',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 14),
                            ),
                            hintText: 'enter your email address',
                            border: OutlineInputBorder()),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      width: containerWidth,
                      height: 50,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.9),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(3))),
                        child: DropdownButton(
                          underline: Container(),
                          value: controller.selectedOption.value,
                          items: options.map((String option) {
                            return DropdownMenuItem<String>(
                              value: option,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                                child: Text(option),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            controller.selectedOption.value = newValue!;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      width: containerWidth,
                      height: 50,
                      child: TextField(
                        focusNode: _phonefocus,
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 14),
                        decoration: const InputDecoration(
                            label: Text(
                              'Phone number',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 14),
                            ),
                            hintText: 'enter your mobile number',
                            border: OutlineInputBorder()),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      width: containerWidth,
                      height: 50,
                      child: TextField(
                        obscureText: _obscurer.isVisible.value,
                        focusNode: _passwordfocus,
                        style: const TextStyle(fontSize: 13),
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0)),
                            ),
                            labelText: 'Enter Password',
                            suffixIcon: IconButton(
                                onPressed: () {
                                  _obscurer.passwordObscureToggle();
                                },
                                icon: Icon(
                                  _obscurer.isVisible.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  size: 16,
                                ))),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      width: containerWidth,
                      height: 50,
                      child: TextField(
                        obscureText: _obscurer.isCVisible.value,
                        focusNode: _confirmpasswordfocus,
                        style: const TextStyle(fontSize: 13),
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0)),
                            ),
                            labelText: 'Confirm password Password',
                            suffixIcon: IconButton(
                                onPressed: () {
                                  _obscurer.confirmPasswordObscureToggle();
                                },
                                icon: Icon(
                                  _obscurer.isCVisible.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  size: 16,
                                ))),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      width: containerWidth,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: _obscurer.checked.value,
                            onChanged: _obscurer.confirmChecked,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 230,
                                child: RichText(
                                    textAlign: TextAlign.center,
                                    text: const TextSpan(
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.black54),
                                        children: [
                                          TextSpan(
                                              text:
                                                  'By submitting this form you accept'),
                                          TextSpan(
                                              text: ' Sharpman paypoint',
                                              style: TextStyle(
                                                  color: Color(0xFF5423BB))),
                                          TextSpan(
                                              text: ' Terms & Conditions ',
                                              style: TextStyle(
                                                  color: Color(0xFF5423BB))),
                                          TextSpan(
                                            text: ' And Allow',
                                          ),
                                          TextSpan(
                                              text: ' Sharpman paypoint',
                                              style: TextStyle(
                                                  color: Color(0xFF5423BB))),
                                          TextSpan(
                                            text: ' to',
                                          ),
                                          TextSpan(
                                            text: ' Contact you',
                                          )
                                        ])),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: containerWidth,
                        height: 35,
                        decoration: const BoxDecoration(
                            boxShadow: [BoxShadow(color: Colors.black45)],
                            gradient: LinearGradient(
                                colors: buttongradient,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: TextButton(
                          onPressed: () => {Get.to(CompletionScreen())},
                          child: const Text(
                            'Create my account',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an acoount?',
                          style:
                              TextStyle(fontSize: 12, color: Color(0xFF5423BB)),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.to(SignIn());
                            },
                            child: Text('Sign In'))
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
