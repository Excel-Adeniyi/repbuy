import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/utility_controller/utility_controller.dart';
import 'package:shapmanpaypoint/utils/width.dart';

class SinglePurchasedItemPage extends StatelessWidget {
  const SinglePurchasedItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic transaction = Get.arguments;
    UtilityController utilityController = Get.put(UtilityController());

    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        final product = utilityController.utilityPlan.firstWhereOrNull(
            (element) => element.id == int.parse(transaction.operatorId));
        print("THE TRANSACTION ${transaction.operatorId} ${product?.name}");
        return Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey,
              ),
              width: calculateContainerWidth(context),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Purchase Type:'),
                        Text(transaction.purchase_type)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Product:'),
                        Text(product!.name.isNotEmpty
                            ? product.name
                            : "Product name")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [const Text('Amount:'), Text(transaction.amount)],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Number:'), Text("Something")],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Status:'),
                        transaction.success == 0 &&
                                transaction.purchase_type != "successful" &&
                                transaction.purchase_type != "Electric"
                            ? const Text(
                                "Failed",
                                style: TextStyle(color: Colors.red),
                              )
                            : transaction.success == 0 &&
                                    transaction.purchase_type != "successful" &&
                                    transaction.purchase_type == "Electric"
                                ? Text("Pending",
                                    style: TextStyle(color: Colors.yellow[700]))
                                : transaction.success == 1 &&
                                        transaction.status == "successful"
                                    ? Text('Successful',
                                        style:
                                            TextStyle(color: Colors.green[700]))
                                    : const Text("Falied",
                                        style: TextStyle(color: Colors.red))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Transaction id:'),
                        Text(transaction.ntransactionId)
                      ],
                    ),
                    TextButton(onPressed: () {}, child: const Text("Done"))
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
