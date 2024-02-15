import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shapmanpaypoint/controller/currency/currencyController.dart';
import 'package:shapmanpaypoint/utils/arrays/currency.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';

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
    final CurrencyController _currency = Get.put(CurrencyController());
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
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Bank Transfer',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Currency'),
                          Container(
                            width: 170,
                            padding: const EdgeInsets.fromLTRB(8, 1, 0, 1),
                            decoration: BoxDecoration(
                              // gradient: LinearGradient(colors: buttongradient),
                              border: Border.all(color: Colors.purple),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: DropdownButton<String>(
                                underline: Container(),
                                isExpanded: true,
                                value: _currency.currencyValue.value,
                                items: _currency.currency.map((String item) {
                                  return DropdownMenuItem<String>(
                                      value: item, child: Text(item));
                                }).toList(),
                                onChanged: (value) {
                                  _currency.currencyValue.value = value!;
                                }),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Amount'),
                        Container(
                          width: 170,
                          height: 52,
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.purple),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: TextField(
                            focusNode: amountFocus,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                hintText: 'Amount', border: InputBorder.none),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              TextInputFormatter.withFunction(
                                (oldValue, newValue) {
                                  final enteredValue = double.tryParse(
                                      newValue.text.replaceAll(',', ''));

                                  if (enteredValue != null) {
                                    final formattedText =
                                        NumberFormat('#,##0.0', 'en_US')
                                            .format(enteredValue);
                                    _currency.amount.value = formattedText;
                                    return TextEditingValue(
                                      text: formattedText,
                                      selection: TextSelection.collapsed(
                                          offset: formattedText.length),
                                    );
                                  } else {
                                    return newValue;
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
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
                const SizedBox(
                  height: 20,
                ),
                Container(
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
                const SizedBox(
                  height: 20,
                ),
                Container(
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
                const SizedBox(
                  height: 20,
                ),
                Container(
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
                const SizedBox(
                  height: 20,
                ),
                Container(
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
                const SizedBox(
                  height: 20,
                ),
                Container(
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
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                      const SizedBox(
                        width: 100,
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
