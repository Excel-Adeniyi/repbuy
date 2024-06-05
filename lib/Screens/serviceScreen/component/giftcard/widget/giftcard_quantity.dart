import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/GiftCard/gift_card_controller.dart';

class GiftCardQuantity extends StatelessWidget {
  GiftCardQuantity({super.key});
  TextEditingController textController = TextEditingController();
  GiftCardController giftCardController = Get.find<GiftCardController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
              width: 1.0, color: const Color.fromARGB(255, 73, 22, 105))),
      height: 65,
      width: double.infinity,
      child: Obx(() {
        textController.text = giftCardController.giftcardQuantity.value;
        return TextField(
          cursorColor: Colors.purple,
          cursorErrorColor: Colors.grey,
          controller: textController,
          keyboardType: TextInputType.number,
          style: const TextStyle(),
          readOnly: true,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            prefixIcon: IconButton(
                onPressed: () {
                  giftCardController.decrementQuantity();
                  giftCardController.calculateTotalPrice();
                  giftCardController.commissionCalculator();
                  giftCardController.totalPrice();
                },
                icon: const Icon(Icons.remove)),
            suffixIcon: IconButton(
                onPressed: () {
                  
                  giftCardController.incrementQuantity();
                  giftCardController.calculateTotalPrice();
                  giftCardController.commissionCalculator();
                  giftCardController.totalPrice();
                },
                icon: const Icon(Icons.add)),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 73, 22, 105)),
            ),
            labelStyle: const TextStyle(color: Colors.grey),
            errorBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 73, 22, 105))),
            labelText: 'Quantity',
            // error: utilityController.showError(),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple)),
          ),
          onChanged: (dynamic amountValue) {
            // utilityController.amountValidator(amountValue);
            // utilityController.purchaseSum();
          },
        );
      }),
    );
  }
}
