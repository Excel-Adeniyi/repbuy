import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Model/ISOData/iso_model.dart';
import 'package:shapmanpaypoint/controller/Effects/on_tap.dart';
import 'package:shapmanpaypoint/controller/Iso/iso_controller.dart';
import 'package:shapmanpaypoint/controller/contact_picker/contact_picker.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:shapmanpaypoint/controller/validator/airtime_validator.dart';
import 'package:shapmanpaypoint/services/activateAuthenticators.dart';
import 'package:shapmanpaypoint/utils/responsiveness/buttonWidth.dart';
import 'package:shapmanpaypoint/utils/width.dart';
import 'package:shapmanpaypoint/widgets/amountPrompt/amount_prompt.dart';
import 'package:shapmanpaypoint/widgets/balanceTopup/balanceTop.dart';
import 'package:shapmanpaypoint/controller/rechargeController.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';
import 'package:dropdown_search/dropdown_search.dart';
// import 'package:shapmanpaypoint/utils/dialog/dialogShow.dart';

class RechargeCard extends StatelessWidget {
  final String title = Get.arguments ?? "Airtime";
  final RechargeController imageSelector = Get.put(RechargeController());
  final ContactPickerController contactController =
      Get.put(ContactPickerController());
  final IsoController isoController = Get.put(IsoController());
  final PhoneController phoneNumberContoller = Get.put(PhoneController());
  // final AirtimeCController _airtimeController = Get.put(AirtimeCController());
  // final LoaderController _loaderController = Get.put(LoaderController());
  final _ontapEffectController = Get.put(OnTapEffect());
  final airtimeAuth = AirtimeAuth();
  RechargeCard({Key? key}) : super(key: key);
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
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                            colors: buttongradient,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)
                        .createShader(bounds);
                  },
                  child: Text(
                    title.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: imageSelector.buttonValue
                          .map((value) => GetBuilder<RechargeController>(
                                  builder: (controller) {
                                return SizedBox(
                                  width: 150,
                                  height: 50,
                                  child: Container(
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
                                        style: ElevatedButton.styleFrom(
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
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border:
                        Border.all(width: 1.0, color: const Color(0xff0a2417)),
                  ),
                  height: 65,
                  width: calculateContainerWidth(context),
                  child: Obx(
                    () => DropdownSearch<String>(
                      // mode: Mode.MENU,
                      popupProps: const PopupProps.menu(
                        showSearchBox: true,
                      ), // or Mode.BOTTOM_SHEET

                      items: isoController.isoDetails
                          .map<String>((Iso item) => item.name)
                          .toList(),
                      selectedItem: isoController.selectedCountry.value,
                      dropdownDecoratorProps: const DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8.0),
                        border: InputBorder.none,
                      )),
                      onChanged: (String? newValue) {
                        final output = isoController.isoDetails
                            .firstWhere((element) => newValue == element.name);
                        // print(output.isoName);
                        isoController.selectedCountry.value = output.name;
                        isoController.isoName.value = output.isoName;
                      },
                      dropdownBuilder: (context, selectedItem) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            selectedItem ?? "Select Country",
                            style: const TextStyle(
                              fontFamily: 'Poppin',
                              fontSize: 16,
                              color: Color(0xff0a2417),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                //######END ISONAME #######
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  alignment: Alignment.centerRight,
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                              colors: buttongradient,
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft)
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

                SizedBox(
                  height: 100,

                  //############TextField#############

                  child: Obx(
                    () {
                      return TextField(
                        controller:
                            contactController.phonController.phoneController,
                        cursorColor: const Color.fromARGB(255, 21, 74, 117),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        onChanged: (value) => {
                          {phoneNumberContoller.phoneNumber.value = value}
                        },
                        readOnly:
                            imageSelector.selectedButton.value != 'Buy for Self'
                                ? false
                                : true,
                        maxLength: 16,
                        decoration: InputDecoration(
                          labelText: 'Phone number',
                          error: Obx(() {
                            final validatorError =
                                phoneNumberContoller.validatePhoneNumber(
                                    phoneNumberContoller.phoneNumber.value);
                            return validatorError != null &&
                                    contactController.phonController
                                            .phoneController.text !=
                                        ''
                                ? contactController.phonController
                                            .phoneController.text.length <
                                        10
                                    ? Text(validatorError,
                                        style:
                                            const TextStyle(color: Colors.red))
                                    : const Text('')
                                : const Text('');
                          }),
                          focusColor: Colors.black54,
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xfffcdc2a))),
                          labelStyle: const TextStyle(color: Color(0xff0a2417)),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff0a2417))),
                          focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xfffcdc2a))),
                          errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff0a2417))),
                          suffixIcon: GestureDetector(
                            onTap: () async {
                              if (imageSelector.selectedButton.value !=
                                  'Buy for Self') {
                                await contactController.pickContacts();
                              }
                            },
                            child: const Icon(
                              Icons.contact_phone_sharp,
                              color: Color(0xff0a2417),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                //########## End Phone Text Field ###########

                //########## Amount Field ###############
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 100,
                  child: TextField(
                    controller: imageSelector.amountCont,
                    cursorColor: const Color.fromARGB(255, 21, 74, 117),
                    onChanged: (value) {
                      phoneNumberContoller.amountField.value = value;
                    },
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      error: Obx(() {
                        final validatorError =
                            phoneNumberContoller.validateAmountField(
                                phoneNumberContoller.amountField.value);
                        return validatorError != null
                            ? Text(
                                validatorError,
                                style: const TextStyle(color: Colors.red),
                              )
                            : const Text('');
                      }),
                      focusColor: Colors.black54,
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfffcdc2a))),
                      labelText: 'Enter Amount',
                      labelStyle: const TextStyle(color: Color(0xff0a2417)),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff0a2417))),
                      focusedErrorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xfffcdc2a))),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff0a2417))),
                    ),
                  ),
                ),

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
                            imageSelector.amountCont.text.isNotEmpty &&
                            validatorAmount == null &&
                            validatorPhone == null) {
                          Get.to(AmountPrompt(title: title));
                          airtimeAuth.activator("");
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
