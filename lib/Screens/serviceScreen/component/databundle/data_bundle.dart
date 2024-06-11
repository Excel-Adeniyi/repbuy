import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/databundle/widget/amount_prompt.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/databundle/widget/bundle_selector.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/databundle/widget/price_field.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/databundle/widget/provider_selector.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/databundle/widget/user_number.dart';
import 'package:shapmanpaypoint/controller/DataBundle/data_bundle.dart';
import 'package:shapmanpaypoint/controller/Effects/on_tap.dart';
import 'package:shapmanpaypoint/controller/Iso/isoController.dart';
import 'package:shapmanpaypoint/controller/contact_picker/contact_picker.dart';
import 'package:shapmanpaypoint/controller/validator/airtime_validator.dart';
import 'package:shapmanpaypoint/services/activateAuthenticators.dart';
import 'package:shapmanpaypoint/utils/responsiveness/buttonWidth.dart';
import 'package:shapmanpaypoint/widgets/balanceTopup/balanceTop.dart';
import 'package:shapmanpaypoint/controller/rechargeController.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';

class DataBundleScreen extends StatelessWidget {
  // final String title = Get.arguments;
  final RechargeController imageSelector = Get.put(RechargeController());
  final ContactPickerController contactController =
      Get.put(ContactPickerController());
  final IsoController isoController = Get.put(IsoController());
  final DataBundleController databundleController =
      Get.put(DataBundleController());
  final PhoneController phoneNumberContoller = Get.put(PhoneController());
  final _ontapEffectController = Get.put(OnTapEffect());
  final airtimeAuth = AirtimeAuth();
  DataBundleScreen({Key? key}) : super(key: key);
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    final validatorPhone = phoneNumberContoller
        .validateAmountField(phoneNumberContoller.amountField.value);
    final validatorAmount = phoneNumberContoller
        .validateAmountField(phoneNumberContoller.amountField.value);
    Size screenSize = MediaQuery.sizeOf(context);
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
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to the specified route
            Get.toNamed('dashboard');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: screenSize.width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                            colors: buttongradient,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)
                        .createShader(bounds);
                  },
                  child: const Text(
                    'Data Top up',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
                TopBalance(),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(2, 7, 2, 7),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      gradient: LinearGradient(
                          colors: buttongradient,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: imageSelector.buttonValue
                          .map((value) => GetBuilder<RechargeController>(
                                  builder: (controller) {
                                return FittedBox(
                                  child: Container(
                                    width: 150,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        color:
                                            controller.selectedButton.value ==
                                                    value
                                                ? Colors.black87
                                                : Colors.white),
                                    child: TextButton(
                                        onPressed: () {
                                          controller
                                              .setSelectButtonValue(value);
                                        },
                                        // clipBehavior: Clip.antiAlias,
                                        style: TextButton.styleFrom(
                                          shape: const RoundedRectangleBorder(
                                              
                                          ),
                                          // side: BorderSide(width: 0.0),
                                            foregroundColor: controller
                                                        .selectedButton.value ==
                                                    value
                                                ? Colors.black87
                                                : Colors.white,
                                            backgroundColor: controller
                                                        .selectedButton.value ==
                                                    value
                                                ? Colors.black87
                                                : Colors.white),
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                              color: controller.selectedButton
                                                          .value ==
                                                      value
                                                  ? Colors.white
                                                  : const Color(0xff0a2417)),
                                        )),
                                  ),
                                );
                              }))
                          .toList()),
                ),

                //######## ISO NAME #################
                const SizedBox(
                  height: 30
                ),

                //######END Data Name and Operator Id #######

                const ProviderSelector(),
                //########## DATA BUNDLE amount and data package ################
                const SizedBox(
                  height: 40,
                ),

                const BundleSelector(),

                //############# DATA BUNDLE amount and data package end ################
                const SizedBox(
                  height: 30,
                ),
                //############# DATA BUNDLE PRICE ###################
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  alignment: Alignment.centerRight,
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                              colors: buttongradient,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight)
                          .createShader(bounds);
                    },
                    child: const Text(
                      'Find Beneficiary',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                const UserMobile(),
                //########## End Phone Text Field ###########

                //########## Amount Field ###############
                const SizedBox(
                  height: 15,
                ),
               
                const PriceField(),
                //############### END Amount ###########

                //############### BEGIN SUBMIT ##############
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
                          colors: _ontapEffectController.isTapped.value
                              ? isbuttongradient
                              : buttongradient,
                       begin: Alignment.bottomRight,
                                            end: Alignment.topCenter),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    onPressed: () {
                      _ontapEffectController.isTapped.value = true;
                      Future.delayed(const Duration(milliseconds: 1000), () {
                        _ontapEffectController.isTapped.value = false;
                        _ontapEffectController.isBSopen.value = false;
                        // print("WORKING");
                        if (contactController.phonController.phoneController
                                .text.isNotEmpty &&
                            databundleController
                                .priceController.text.isNotEmpty &&
                            validatorAmount == null &&
                            validatorPhone == null) {
                          Get.to(DataAmountPrompt());
                          airtimeAuth.activator("Data Top Up");
                        }
                        // Get.to(PinAuth(title: title));
                      });
                    },
                    child: _ontapEffectController.isTapped.value == true
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
                const SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getImageWidgets() {
    return imageSelector.images.map((image) {
      // final isSelectedObservable = image.isSelected.obs;
      return GestureDetector(
        onTap: () {
          imageSelector.selectImage(image.value);
          // print(image.value);
        },
        child: GetBuilder<RechargeController>(
          builder: (controller) {
            return Container(
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                      color: controller.isImageSelected(image.value)
                          ? Colors.purple
                          : Colors.grey,
                      width:
                          controller.isImageSelected(image.value) ? 2 : 0.2)),
              child: Image.asset(
                image.value,
                width: 50,
                height: 30,
              ),
            );
          },
        ),
      );
    }).toList();
  }
}
