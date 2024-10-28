import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Screens/login/signinScreen/signIn.dart';
import 'package:shapmanpaypoint/controller/Auth/signup_controller.dart';
import 'package:shapmanpaypoint/controller/dropdownController.dart';
import 'package:shapmanpaypoint/controller/passwordtoggle.dart';
import 'package:shapmanpaypoint/services/SignupService/signup_service.dart';
import 'package:shapmanpaypoint/utils/countries/countries.dart';
import 'package:shapmanpaypoint/utils/responsiveness/responsiveness.dart';
import 'package:string_validator/string_validator.dart';

import '../../utils/colors/coloors.dart';

class SignupScreen extends StatelessWidget {
  final _obscurer = Get.find<PasswordController>();
  final _firstnamefocus = FocusNode();
  final _secondnamefocus = FocusNode();
  final _emailfocus = FocusNode();
  final _phonefocus = FocusNode();
  final _passwordfocus = FocusNode();
  final _confirmpasswordfocus = FocusNode();
  final DropdownController controller = Get.put(DropdownController());
  final SignUpController editController = Get.find<SignUpController>();
  final signupService = SignUpService();
  List<String> options = country_list;

  SignupScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double containerHeight;
    if (screenHeight < 480) {
      containerHeight = 300;
    } else if (screenHeight < 900) {
      containerHeight = 700;
    } else {
      containerHeight = 1300;
    }
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
          child: SizedBox(
            height: containerHeight,
            child: SingleChildScrollView(
              child: Obx(
                () {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                                  colors: headerTextGradient,
                                  begin: Alignment.bottomRight,
                                  end: Alignment.topLeft)
                              .createShader(bounds);
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: containerWidth,
                        child: TextButton(
                          style: ButtonStyle(
                              shadowColor:
                                  WidgetStateProperty.all(Colors.black54),
                              elevation: WidgetStateProperty.all(8),
                              backgroundColor:
                                  WidgetStateProperty.all(Colors.white),
                              fixedSize: WidgetStateProperty.all(
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
                        // height: 75,
                        child: TextField(
                          controller: editController.firstname,
                          focusNode: _firstnamefocus,
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 14),
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              focusedErrorBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xfffcdc2a))),
                              errorBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xfffcdc2a))),
                              error: editController.firstnameValidator.value ==
                                      true
                                  ? const Text(
                                      "First name should not be empty",
                                      style: TextStyle(color: Colors.red),
                                    )
                                  : const SizedBox.shrink(),
                              label: const Text(
                                'First name',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 14),
                              ),
                              hintText: 'enter your last first name',
                              border: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xfffcdc2a)),
                              )),
                          onChanged: (newValue) {
                            if (newValue.isEmpty) {
                              editController.firstnameValidator.value = true;
                            } else {
                              editController.firstnameValidator.value = false;
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: containerWidth,
                        // height: 75,
                        child: TextField(
                          controller: editController.lastname,
                          focusNode: _secondnamefocus,
                          keyboardType: TextInputType.name,
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 14),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xfffcdc2a)),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xfffcdc2a))),
                            errorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xfffcdc2a))),
                            error:
                                editController.lastnameValidator.value == true
                                    ? const Text(
                                        "Last name should not be empty",
                                        style: TextStyle(color: Colors.red),
                                      )
                                    : const SizedBox.shrink(),
                            label: const Text(
                              'Last name',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 14),
                            ),
                            hintText: 'enter your last name',
                          ),
                          onChanged: (newValue) {
                            if (newValue.isEmpty) {
                              editController.lastnameValidator.value = true;
                            } else {
                              editController.lastnameValidator.value = false;
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: containerWidth,
                        // height: 75,
                        child: TextField(
                          controller: editController.email,
                          focusNode: _emailfocus,
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 14),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 16, 59, 15)),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 16, 59, 15))),
                            errorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xfffcdc2a))),
                            error: editController.emailValidator.value == true
                                ? const Text(
                                    "Email must be valid",
                                    style: TextStyle(color: Colors.red),
                                  )
                                : const SizedBox.shrink(),
                            label: const Text(
                              'Email',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 14),
                            ),
                            hintText: 'enter your email address',
                          ),
                          onChanged: (newValue) {
                            if (newValue.isNotEmpty) {
                              final value = isEmail(newValue);
                              // print(value);
                              if (value == true) {
                                editController.emailValidator.value = false;
                                // print(newValue);
                              } else {
                                editController.emailValidator.value = true;
                                // print("BBB");
                              }
                            } else {
                              editController.emailValidator.value = true;
                              // print("rubbish");
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: containerWidth,
                        height: 60,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xfffcdc2a), width: 0.9),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(3))),
                          child: Align(
                            alignment: Alignment.center,
                            child: DropdownButton(
                              // isExpanded: true,
                              isDense: true,
                              underline: Container(),
                              value: controller.selectedOption.value,
                              items: options.map((String option) {
                                return DropdownMenuItem<String>(
                                  value: option,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Text(
                                      option,
                                      style: const TextStyle(
                                          color: Colors.black54),
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                controller.selectedOption.value = newValue!;
                                editController.country.value = newValue;
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: containerWidth,
                        // height: 75,
                        child: TextField(
                          controller: editController.phone,
                          focusNode: _phonefocus,
                          keyboardType: TextInputType.phone,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 14),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 16, 59, 15)),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 16, 59, 15))),
                            errorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xfffcdc2a))),
                            error: editController.phoneValidator.value == true
                                ? const Text(
                                    "Phone should not be empty",
                                    style: TextStyle(color: Colors.red),
                                  )
                                : const SizedBox.shrink(),
                            label: const Text(
                              'Phone number',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 14),
                            ),
                            hintText: 'enter your mobile number',
                          ),
                          onChanged: (newValue) {
                            if (newValue.isNotEmpty) {
                              final value = isNumeric(newValue);
                              print(value);
                              if (value == true) {
                                editController.phoneValidator.value = false;
                              } else {
                                editController.phoneValidator.value = true;
                              }
                            } else {
                              editController.phoneValidator.value = true;
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: containerWidth,
                        // height: 75,
                        child: TextField(
                          obscureText: _obscurer.isVisible.value,
                          controller: editController.password,
                          focusNode: _passwordfocus,
                          style: const TextStyle(fontSize: 13),
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 16, 59, 15)),
                              ),
                              focusedErrorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 16, 59, 15))),
                              errorBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xfffcdc2a))),
                              error:
                                  editController.passwordValidator.value == true
                                      ? const Text(
                                          "Password should not be empty",
                                          style: TextStyle(color: Colors.red),
                                        )
                                      : const SizedBox.shrink(),
                              label: const Text(
                                'Enter Password',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 14),
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    _obscurer.passwordObscureToggle();
                                  },
                                  icon: Icon(
                                    color: Colors.black54,
                                    _obscurer.isVisible.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    size: 16,
                                  ))),
                          onChanged: (newValue) {
                            if (newValue.isNotEmpty) {
                              editController.passwordValidator.value == false;
                            } else {
                              editController.passwordValidator.value == true;
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: containerWidth,
                        // height: 75,
                        child: TextField(
                          controller: editController.confirmpassword,
                          obscureText: _obscurer.isCVisible.value,
                          focusNode: _confirmpasswordfocus,
                          style: const TextStyle(fontSize: 13),
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 16, 59, 15)),
                              ),
                              focusedErrorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 16, 59, 15))),
                              errorBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xfffcdc2a))),
                              errorText: editController
                                          .confirmpasswordValidator.value ==
                                      true
                                  ? "Password does not match"
                                  : "",
                              label: const Text(
                                'Confirm password',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 14),
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    _obscurer.confirmPasswordObscureToggle();
                                  },
                                  icon: Icon(
                                    color: Colors.black54,
                                    _obscurer.isCVisible.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    size: 16,
                                  ))),
                          onChanged: (newValue) {
                            if (newValue != editController.password.text) {
                              editController.confirmpasswordValidator.value =
                                  true;
                            } else {
                              editController.confirmpasswordValidator.value =
                                  false;
                            }
                          },
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
                              checkColor: Colors.white,
                              value: _obscurer.checked.value,
                              onChanged: (newValue) {
                                _obscurer.confirmChecked(newValue);

                                editController.onChangedValue();
                                editController.terms.value = newValue!;
                              },
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
                                                text: ' REPBUY',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 16, 59, 15))),
                                            TextSpan(
                                                text: ' Terms & Conditions ',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 16, 59, 15))),
                                            TextSpan(
                                              text: ' And Allow',
                                            ),
                                            TextSpan(
                                                text: 'REPBUY',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 16, 59, 15))),
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
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: containerWidth,
                              height: 50,
                              decoration: const BoxDecoration(
                                  boxShadow: [BoxShadow(color: Colors.black45)],
                                  gradient: LinearGradient(
                                      colors: buttongradient,
                                      begin: Alignment.bottomRight,
                                      end: Alignment.topCenter),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: TextButton(
                                  style: const ButtonStyle(),
                                  onPressed: () => {signupService.signinAuth()},
                                  child: editController.isLoading.value == false
                                      ? const Text(
                                          'Create my account',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 15),
                                        )
                                      : const CircularProgressIndicator
                                          .adaptive()),
                            ),
                            Visibility(
                                visible: editController.isVisible.value,
                                child: Container(
                                  width: containerWidth,
                                  height: 50,
                                  color: Colors.white.withOpacity(0.5),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an acoount?',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.to(SignIn());
                              },
                              child: const Text('Sign In'))
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
