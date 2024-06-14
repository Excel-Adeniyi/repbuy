import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/currency/currencyController.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';
import 'package:shapmanpaypoint/utils/width.dart';

class BankTransfer extends StatelessWidget {
  final amountFocus = FocusNode();
  final nameFocus = FocusNode();
  final countryFocus = FocusNode();
  final stateFocus = FocusNode();
  final cityFocus = FocusNode();
  final zipcodeFocus = FocusNode();
  final addressFocus = FocusNode();
  BankTransfer({super.key});

  @override
  Widget build(BuildContext context) {
    final CurrencyController currency = Get.put(CurrencyController());
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
        body: SingleChildScrollView(
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
                  child: Obx(
                    () => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Currency'),
                            Container(
                              width: 100,
                              padding: const EdgeInsets.fromLTRB(8, 1, 0, 1),
                              decoration: BoxDecoration(
                                // gradient: LinearGradient(colors: buttongradient),
                                border:
                                    Border.all(color: const Color(0xff0a2417)),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: DropdownButton<String>(
                                  underline: Container(),
                                  isExpanded: true,
                                  value: currency.currencyValue.value,
                                  items: currency.currency.map((String item) {
                                    return DropdownMenuItem<String>(
                                        value: item, child: Text(item));
                                  }).toList(),
                                  onChanged: (value) {
                                    currency.currencyValue.value = value!;
                                  }),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Amount'),
                            Container(
                              width: 200,
                              padding: const EdgeInsets.fromLTRB(8, 1, 0, 1),
                              decoration: BoxDecoration(
                                // gradient: LinearGradient(colors: buttongradient),
                                border:
                                    Border.all(color: const Color(0xff0a2417)),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: TextField(
                                focusNode: amountFocus,
                                keyboardType: TextInputType.number,
                                controller: TextEditingController(
                                    text: currency.amount.value),
                                decoration: const InputDecoration(
                                    hintText: 'Amount',
                                    border: InputBorder.none),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: screenWidth,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff0a2417)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    width: 400,
                    child: TextField(
                      focusNode: nameFocus,
                      decoration: const InputDecoration(
                          hintText: 'Full Name/Company Name',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: screenWidth,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff0a2417)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    width: 400,
                    child: TextField(
                      focusNode: countryFocus,
                      decoration: const InputDecoration(
                          hintText: 'Country', border: InputBorder.none),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: screenWidth,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: const Color(0xff0a2417)),
                    ),
                    width: 400,
                    child: TextField(
                      focusNode: stateFocus,
                      decoration: const InputDecoration(
                          hintText: 'State', border: InputBorder.none),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: screenWidth,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: const Color(0xff0a2417)),
                    ),
                    width: 400,
                    child: TextField(
                      focusNode: cityFocus,
                      decoration: const InputDecoration(
                          hintText: 'Cities', border: InputBorder.none),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: screenWidth,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: const Color(0xff0a2417)),
                    ),
                    width: 400,
                    child: TextField(
                      focusNode: zipcodeFocus,
                      decoration: const InputDecoration(
                          hintText: 'Zip Code', border: InputBorder.none),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: screenWidth,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: const Color(0xff0a2417)),
                    ),
                    width: 400,
                    child: TextField(
                      focusNode: addressFocus,
                      decoration: const InputDecoration(
                          hintText: 'Address', border: InputBorder.none),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: calculateContainerWidth(context),
                  child: Container(
                    // width: 150,
                    // height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(55, 0, 0, 0),
                            offset: Offset(2, 3))
                      ],
                      gradient: const LinearGradient(colors:buttongradient,  begin: Alignment.bottomRight,
                                            end: Alignment.topCenter),
                      border: Border.all(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          strokeAlign: BorderSide.strokeAlignOutside),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed('paymentsummary');
                      },
                      child: const Text(
                        'Make Payment',
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
        ),
      ),
    );
  }
}
