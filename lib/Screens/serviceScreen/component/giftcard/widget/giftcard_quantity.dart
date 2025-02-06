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
          border: Border.all(width: 1.0, color: const Color(0xff0a2417))),
      height: 65,
      width: double.infinity,
      child: Obx(() {
        textController.text = giftCardController.giftcardQuantity.value;
        return TextField(
          cursorColor: const Color(0xff0a2417),
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
              borderSide: BorderSide(color: Color(0xfffcdc2a)),
            ),
            labelStyle: const TextStyle(color: Colors.black45),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xfffcdc2a))),

            // error: utilityController.showError(),
            border: const OutlineInputBorder(borderSide: BorderSide.none),
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
