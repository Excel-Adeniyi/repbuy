import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shapmanpaypoint/controller/Auth/pincode_controller.dart';
import 'package:shapmanpaypoint/controller/Auth/signup_controller.dart';
import 'package:shapmanpaypoint/services/SignupService/pincode_service.dart';
import '../../../widgets/dailbutton/customdailpad.dart';
import '../../../utils/colors/coloors.dart';

class ConfirmPinScreen extends StatelessWidget {
  var pagecondition = (Get.previousRoute == '/otp');
  final PinCodeController _pincode = Get.find<PinCodeController>();
  final userPin = PincodeService();
  final SignUpController editcontroller = Get.find<SignUpController>();
  final TextEditingController confirmpincontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    const title = 'Security PIN';
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth;
    if (screenWidth < 600) {
      containerWidth = 300.0;
    } else if (screenWidth < 1200) {
      containerWidth = 400.0;
    } else {
      containerWidth = 500.0;
    }
    // print('dgs' + title);
    return GestureDetector(
      onTap: () {
        FocusNode().unfocus();
      },
      child: Scaffold(
        body: GestureDetector(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                              colors: [
                            Color(0xFF5423bb),
                            Color(0xFF8629b1),
                            Color(0xFFa12cab),
                          ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)
                          .createShader(bounds);
                    },
                    child: const Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Re-type security our pin",
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Confirm your security Pin',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: containerWidth,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          gradient: LinearGradient(
                              colors: buttongradient,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomRight)),
                      child: Column(
                        children: [
                          PinCodeTextField(
                            controller: _pincode.confirmpinController,
                            appContext: context,
                            obscuringCharacter: '*',
                            obscureText: true,
                            length: 4,
                            onChanged: (newValue) {
                              if (newValue != null && newValue.length == 4) {
                                _pincode.updateControllers(newValue);
                                print(" ENDC ${confirmpincontroller.text}");
                              }
                            },
                            blinkWhenObscuring: true,
                            pinTheme: PinTheme(
                                activeFillColor: Colors.white,
                                activeColor: Colors.white,
                                selectedColor: Colors.white,
                                selectedFillColor: Colors.white,
                                inactiveFillColor: Colors.white,
                                inactiveColor: Colors.white,
                                borderWidth: 0,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(29)),
                                fieldHeight: 50),
                            boxShadows: const [
                              BoxShadow(
                                offset: Offset(0, 1),
                                color: Colors.orange,
                                blurRadius: 0,
                              )
                            ],
                            enableActiveFill: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomDialPad(pinController: _pincode.confirmpinController),
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
                        gradient: const LinearGradient(
                            colors: buttongradient,
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        borderRadius: BorderRadius.circular(16)),
                    child: TextButton(
                      onPressed: () {
                        userPin.pincodeService();
                      },
                      child: editcontroller.isLoading.value == true
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              'Continue',
                              style: TextStyle(
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
        ),
      ),
    );
  }
}
