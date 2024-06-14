import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/UserInfo/user_info.dart';
import 'package:shapmanpaypoint/controller/currency/currencyController.dart';
import 'package:shapmanpaypoint/utils/flutter_storage/flutter_storage.dart';
import 'package:shapmanpaypoint/utils/width.dart';

class AddFundsWithCard extends StatelessWidget {
  const AddFundsWithCard({super.key});

  @override
  Widget build(BuildContext context) {
    final userDetails = Get.find<UserInfoController>();
    final CurrencyController currency = Get.put(CurrencyController());
    FocusNode focusNode = FocusNode();
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: calculateContainerWidth(context),
        child: Column(
          children: [
            Text('User Details'),
            Text('${userDetails.first_name} ${userDetails.last_name}'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Currency'),
                Container(
                  width: 100,
                  padding: const EdgeInsets.fromLTRB(8, 1, 0, 1),
                  decoration: BoxDecoration(
                    // gradient: LinearGradient(colors: buttongradient),
                    border: Border.all(color: const Color(0xff0a2417)),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: DropdownButton<String>(
                      underline: Container(),
                      isExpanded: true,
                      focusColor: const Color(0xfffcdc2a),
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
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Amount'),
              TextField(
                focusNode: focusNode,
                keyboardType: TextInputType.number,
                controller: TextEditingController(text: currency.amount.value),
                decoration: const InputDecoration(
                    hintText: 'Amount', border: InputBorder.none),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
