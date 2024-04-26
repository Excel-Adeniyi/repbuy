import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Model/AirtimeTopModel/airtime_Topup.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/databundle/widget/selected_paymetn.dart';
import 'package:shapmanpaypoint/controller/AirtimeTopUp/airtimeController.dart';
import 'package:shapmanpaypoint/controller/Animation/curve_easin_controller.dart';
import 'package:shapmanpaypoint/controller/Animation/shimmer_controller.dart';
import 'package:shapmanpaypoint/controller/DataBundle/data_bundle.dart';
import 'package:shapmanpaypoint/controller/Effects/on_tap.dart';
import 'package:shapmanpaypoint/controller/Loader/loader_controller.dart';
import 'package:shapmanpaypoint/controller/contact_picker/contact_picker.dart';
import 'package:shapmanpaypoint/services/DataBundle/data_otp_service.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';

class DataAmountPrompt extends StatelessWidget {
  DataAmountPrompt({Key? key}) : super(key: key);
  final _dataDetails = Get.find<AirtimeCController>();
  final _databundleController = Get.find<DataBundleController>();
  final _phoneNumberController = Get.find<ContactPickerController>();
  final _loaderController = Get.find<LoaderController>();
  final _curveInController = Get.put(CurveIn());
  final _ontapEffectController = Get.put(OnTapEffect());
  // final otpServices = DataOTPService();
  final _shimmerController = Get.put(ShimmerEffect());
  @override
  Widget build(BuildContext context) {
    AirtimeModel model = _dataDetails.toModel();
    Size screenSize = MediaQuery.sizeOf(context);
    print('HI $model');
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          if (_loaderController.isLoading == false) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(colors: [
                      Color(0xFF5423bb),
                      Color(0xFF8629b1),
                      Color(0xFFa12cab),
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight)
                        .createShader(bounds);
                  },
                  child: const Text(
                    "Data Top Up",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                AnimatedBuilder(
                  animation: _curveInController.controller,
                  builder: ((context, child) {
                    return AnimatedContainer(
                        duration: const Duration(seconds: 2),
                        height: 300,
                        width: screenSize.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          gradient: LinearGradient(
                              colors: const [
                                Color.fromARGB(235, 83, 35, 187),
                                Color(0xFF5423bb),
                                Color.fromARGB(234, 70, 38, 139),
                                Color.fromARGB(228, 116, 41, 177),
                                Color(0xFFa12cab),
                              ],
                              begin: Alignment(
                                  -1 -
                                      _shimmerController
                                          .animationController.value,
                                  0),
                              end: Alignment(
                                  1 +
                                      _shimmerController
                                          .animationController.value,
                                  0)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(
                              height: 4,
                            ),
                            const Text(
                              'Kindly Verify Transaction',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: "Shantell_Sans",
                                  fontWeight: FontWeight.w400),
                            ),
                            const Divider(),
                            const Text(
                              'phone number:',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              _phoneNumberController
                                  .phonController.phoneController.text,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w400),
                            ),
                            const Text(
                              'provider:',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              _databundleController.selectedPackageName.value
                                  .toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text(
                              'data bundle:',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              _databundleController.selectedFixedValues.value
                                  .toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'amount:',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "${_databundleController.currencySelector.value} ${_databundleController.priceController.text}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 300,
                              padding: const EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.white),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                              ),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Available Balance:',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Roboto',
                                        fontStyle: FontStyle.italic,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'NGN 0.00',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 102, 37, 177),
                                        fontSize: 18,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ));
                  }),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      // margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                      height: 50,
                      width: screenSize.width * 0.8,
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
                              colors: _ontapEffectController.isTapped.value
                                  ? isbuttongradient
                                  : buttongradient,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomRight),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                        onPressed: () {
                          _ontapEffectController.isTapped.value = true;
                          Future.delayed(const Duration(milliseconds: 1000),
                              () {
                            _ontapEffectController.isTapped.value = false;
                            _ontapEffectController.isBSopen.value = false;
                            print("WORKING");
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) =>
                                  const DataSelectPaymentMethod(
                                      title: "Data Top Up"),
                            );

                            // Get.to(PinAuth(title: title));
                          });
                        },
                        child: _ontapEffectController.isTapped.value == true
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Continue',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.east,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      width: screenSize.width * 0.8,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: TextButton(
                        onPressed: () {
                          Get.toNamed('/dashboard');
                        },
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return const LinearGradient(
                                    colors: [
                                  Color(0xFF5423bb),
                                  Color(0xFF8629b1),
                                  Color(0xFFa12cab),
                                ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight)
                                .createShader(bounds);
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            );
          } else {
            return const Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: CircularProgressIndicator(
                      color: Colors.purple,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Processing request ..."),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
