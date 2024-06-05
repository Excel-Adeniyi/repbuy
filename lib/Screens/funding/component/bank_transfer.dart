import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/currency/currencyController.dart';
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
                  'Bank Transfer',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                                border: Border.all(color: Colors.purple),
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
                                border: Border.all(color: Colors.purple),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: TextField(
                                focusNode: amountFocus,
                                keyboardType: TextInputType.number,
                                controller: TextEditingController(
                                    text: currency.amount.value),
                                decoration: const InputDecoration(
                                    hintText: 'Amount', border: InputBorder.none),
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
                      border: Border.all(color: Colors.purple),
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
                      border: Border.all(color: Colors.purple),
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
                      border: Border.all(color: Colors.purple),
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
                      border: Border.all(color: Colors.purple),
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
                      border: Border.all(color: Colors.purple),
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
                      border: Border.all(color: Colors.purple),
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
                  width: screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 150,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(55, 0, 0, 0),
                                offset: Offset(2, 3))
                          ],
                          gradient: const LinearGradient(colors: [
                            Colors.white,
                            Color.fromARGB(255, 160, 153, 153)
                          ]),
                          border: Border.all(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              strokeAlign: BorderSide.strokeAlignOutside),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Get.toNamed('funding');
                          },
                          child: ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return const LinearGradient(
                                      colors: [
                                    Colors.pink,
                                    Colors.pink,
                                    Colors.pink,
                                    Colors.purple
                                  ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.bottomRight)
                                  .createShader(bounds);
                            },
                            child: const Text(
                              'Back',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                     
                      Container(
                        width: 150,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(55, 0, 0, 0),
                                offset: Offset(2, 3))
                          ],
                          gradient: const LinearGradient(colors: [
                            Color(0xFFa12cab),
                            Color(0xFF8629b1),
                            Color(0xFF5423bb),
                          ]),
                          border: Border.all(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              strokeAlign: BorderSide.strokeAlignOutside),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Get.toNamed('paymentsummary');
                          },
                          child: const Text(
                            'Request Transfer',
                            style: TextStyle(
                                fontSize: 16,
                                // fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
