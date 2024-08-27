import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/AdditionalDetailsController/additional_detail_controller.dart';
import 'package:shapmanpaypoint/controller/currency/currencyController.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';

import 'package:shapmanpaypoint/utils/width.dart';

// ignore: must_be_immutable
class BankTransfer extends StatelessWidget {
  final amountFocus = FocusNode();
  final nameFocus = FocusNode();
  final countryFocus = FocusNode();
  final stateFocus = FocusNode();
  final cityFocus = FocusNode();
  final zipcodeFocus = FocusNode();
  final addressFocus = FocusNode();
  TextEditingController amountController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  BankTransfer({super.key});

  @override
  Widget build(BuildContext context) {
    final CurrencyController currency = Get.put(CurrencyController());
    final AdditionalDetailsController addInfo =
        Get.put(AdditionalDetailsController());

    final screenWidth = calculateContainerWidth(context);
    return GestureDetector(
      onTap: () {
        amountFocus.unfocus();
        nameFocus.unfocus();
        countryFocus.unfocus();
        stateFocus.unfocus();
        cityFocus.unfocus();
        zipcodeFocus.unfocus();
        addressFocus.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(() {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'USER INFORMATION FORM',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: screenWidth,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Currency'),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.3,
                              height: 63,
                              padding: const EdgeInsets.fromLTRB(8, 1, 0, 1),
                              decoration: BoxDecoration(
                                // gradient: LinearGradient(colors: buttongradient),
                                border: Border.all(
                                    color: const Color(0xff0a2417), width: 0.7),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: DropdownButton<String>(
                                  underline: Container(),
                                  isExpanded: true,
                                  value:
                                      currency.currencyValue.value.trimLeft(),
                                  items: [
                                    ...currency.currency.entries.map((item) {
                                      return DropdownMenuItem<String>(
                                          value: item.key,
                                          child: Text(
                                            item.value,
                                            overflow: TextOverflow.fade,
                                          ));
                                    }),
                                  ],
                                  onChanged: (String? value) {
                                    if (value!.isNotEmpty) {
                                      addInfo.currency.value = value;
                                      currency.currencyValue.value = value;
                                    } else {
                                      addInfo.currency.value = value;
                                    }
                                  }),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Amount'),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.5,
                              child: TextField(
                                focusNode: amountFocus,
                                controller: amountController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                onSubmitted: (String value) {},
                                onChanged: (String value) {
                                  if (value.isNotEmpty) {
                                    addInfo.amount.value = value;
                                    addInfo.validateAmount(value);
                                  }
                                },
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xff0a2417),
                                            width: 0.9),
                                        borderRadius: BorderRadius.circular(6)),
                                    hintText: 'Amount',
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xff0a2417), width: 1.0),
                                      borderRadius: BorderRadius.circular(6),
                                    )),
                              ),
                            ),
                            addInfo.amountError.value.isNotEmpty
                                ? Text(
                                    addInfo.amountError.value,
                                    style: const TextStyle(
                                        color: Colors.red, fontSize: 10),
                                    overflow: TextOverflow.clip,
                                  )
                                : const SizedBox.shrink(),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  addInfo.userInformation.value == 0
                      ? Column(
                          children: [
                            SizedBox(
                              width: screenWidth,
                              child: TextField(
                                focusNode: nameFocus,
                                controller: fullnameController,
                                onChanged: (String value) {
                                  if (value.isNotEmpty) {
                                    addInfo.fullname.value = value;
                                    addInfo.validateFullname(value);
                                  }
                                },
                                maxLength: 16,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xff0a2417),
                                            width: 0.9),
                                        borderRadius: BorderRadius.circular(6)),
                                    labelText: 'Full Name/Company Name',
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xff0a2417), width: 1.0),
                                      borderRadius: BorderRadius.circular(6),
                                    )),
                              ),
                            ),
                            addInfo.fullnameError.value.isNotEmpty
                                ? Text(
                                    addInfo.fullnameError.value,
                                    style: const TextStyle(
                                        color: Colors.red, fontSize: 10),
                                  )
                                : const SizedBox.shrink(),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: screenWidth,
                              child: TextField(
                                controller: countryController,
                                focusNode: countryFocus,
                                onSubmitted: (String value) {},
                                onChanged: (String value) {
                                  if (value.isNotEmpty) {
                                    addInfo.validateCountry(value);
                                    addInfo.country.value = value;
                                  }
                                },
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xff0a2417),
                                            width: 0.9),
                                        borderRadius: BorderRadius.circular(6)),
                                    labelText: 'Country',
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xff0a2417), width: 1.0),
                                      borderRadius: BorderRadius.circular(6),
                                    )),
                              ),
                            ),
                            addInfo.countryError.value.isNotEmpty
                                ? Text(
                                    addInfo.countryError.value,
                                    style: const TextStyle(
                                        color: Colors.red, fontSize: 10),
                                  )
                                : const SizedBox.shrink(),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: screenWidth,
                              child: TextField(
                                controller: stateController,
                                focusNode: stateFocus,
                                onSubmitted: (String value) {},
                                onChanged: (String value) {
                                  if (value.isNotEmpty) {
                                    addInfo.state.value = value;
                                    addInfo.validateState(value);
                                  }
                                },
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xff0a2417),
                                            width: 0.9),
                                        borderRadius: BorderRadius.circular(6)),
                                    labelText: 'State',
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xff0a2417), width: 1.0),
                                      borderRadius: BorderRadius.circular(6),
                                    )),
                              ),
                            ),
                            addInfo.stateError.value.isNotEmpty
                                ? Text(
                                    addInfo.stateError.value,
                                    style: const TextStyle(
                                        color: Colors.red, fontSize: 10),
                                  )
                                : const SizedBox.shrink(),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: screenWidth,
                              child: TextField(
                                controller: cityController,
                                focusNode: cityFocus,
                                onSubmitted: (value) {},
                                onChanged: (String value) {
                                  if (value.isNotEmpty) {
                                    addInfo.city.value = value;
                                    addInfo.validateCity(value);
                                  }
                                  addInfo.city.value = value;
                                  addInfo.validateCity(value);
                                },
                                decoration: InputDecoration(
                                  labelText: 'City',
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xff0a2417), width: 0.9),
                                      borderRadius: BorderRadius.circular(6)),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xff0a2417), width: 1.0),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                              ),
                            ),
                            addInfo.cityError.value.isNotEmpty
                                ? Text(
                                    addInfo.cityError.value,
                                    style: const TextStyle(
                                        color: Colors.red, fontSize: 10),
                                  )
                                : const SizedBox.shrink(),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: screenWidth,
                              child: TextField(
                                controller: zipcodeController,
                                onSubmitted: (value) {},
                                onChanged: (String value) {
                                  if (value.isNotEmpty) {
                                    addInfo.zipcode.value = value;
                                    addInfo.validateZipCode(value);
                                  }
                                },
                                focusNode: zipcodeFocus,
                                decoration: InputDecoration(
                                  labelText: 'Zip Code',
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xff0a2417), width: 0.9),
                                      borderRadius: BorderRadius.circular(6)),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xff0a2417), width: 1.0),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                              ),
                            ),
                            addInfo.zipcodeError.value.isNotEmpty
                                ? Text(
                                    addInfo.zipcodeError.value,
                                    style: const TextStyle(
                                        color: Colors.red, fontSize: 10),
                                  )
                                : const SizedBox.shrink(),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: screenWidth,
                              child: TextField(
                                controller: addressController,
                                onSubmitted: (String value) {},
                                onChanged: (String value) {
                                  if (value.isNotEmpty) {
                                    addInfo.address.value = value;
                                    addInfo.validateAddress(value);
                                  }
                                },
                                focusNode: addressFocus,
                                decoration: InputDecoration(
                                  labelText: 'Address',
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xff0a2417), width: 0.9),
                                      borderRadius: BorderRadius.circular(6)),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xff0a2417), width: 1.0),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                              ),
                            ),
                            addInfo.addressError.value.isNotEmpty
                                ? Text(
                                    addInfo.addressError.value,
                                    style: const TextStyle(
                                        color: Colors.red, fontSize: 10),
                                  )
                                : const SizedBox.shrink(),
                          ],
                        )
                      : const SizedBox.shrink(),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: calculateContainerWidth(context),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(55, 0, 0, 0),
                              offset: Offset(2, 3))
                        ],
                        gradient: const LinearGradient(
                            colors: buttongradient,
                            begin: Alignment.bottomRight,
                            end: Alignment.topCenter),
                        border: Border.all(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            strokeAlign: BorderSide.strokeAlignOutside),
                      ),
                      child: TextButton(
                        onPressed: () {
                          addInfo.calculateServiceCharge();
                          addInfo.totalPriceCharge();
                          if (addInfo.currency.value.isNotEmpty &&
                              addInfo.amountError.value.isEmpty &&
                              addInfo.amount.value.isNotEmpty &&
                              addInfo.userInformation.value == 1) {
                            Get.toNamed('/paymentsummary');
                            // fundAccount.chargeCardPayment(context);
                          } else if (addInfo.currency.value.isNotEmpty &&
                              addInfo.amountError.value.isEmpty &&
                              addInfo.validateAmount(amountController.text) ==
                                  "" &&
                              addInfo.amount.value.isNotEmpty &&
                              addInfo.userInformation.value == 0 &&
                              addInfo.countryError.value.isEmpty &&
                              addInfo.validateCountry(countryController.text) ==
                                  "" &&
                              addInfo.country.value.isNotEmpty &&
                              addInfo.stateError.value.isEmpty &&
                              addInfo.validateState(stateController.text) ==
                                  "" &&
                              addInfo.state.value.isNotEmpty &&
                              addInfo.cityError.value.isEmpty &&
                              addInfo.validateCity(cityController.text) == "" &&
                              addInfo.city.value.isNotEmpty &&
                              addInfo.zipcodeError.value.isEmpty &&
                              addInfo.validateZipCode(zipcodeController.text) ==
                                  "" &&
                              addInfo.zipcode.value.isNotEmpty &&
                              addInfo.addressError.value.isEmpty &&
                              addInfo.validateAddress(addressController.text) ==
                                  "" &&
                              addInfo.address.value.isNotEmpty &&
                              addInfo.fullnameError.value.isEmpty &&
                              addInfo.validateFullname(
                                      fullnameController.text) ==
                                  "" &&
                              addInfo.fullname.value.isNotEmpty) {
                            Get.toNamed('/paymentsummary');

                          } else {}
                        },
                        child: const Text(
                          'Proceed',
                          style: TextStyle(
                              fontSize: 16,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
