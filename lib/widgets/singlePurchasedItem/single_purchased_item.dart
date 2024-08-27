import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/ShareController/share_controller.dart';
import 'package:shapmanpaypoint/controller/utility_controller/utility_controller.dart';

class SinglePurchasedItemPage extends StatelessWidget {
  const SinglePurchasedItemPage({super.key});
  @override
  Widget build(BuildContext context) {
    final GlobalKey shareglobalKey = GlobalKey();
    dynamic transaction = Get.arguments;
    UtilityController utilityController = Get.put(UtilityController());
    ShareController shareController = Get.put(ShareController());
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        final product = utilityController.utilityPlan.firstWhereOrNull(
            (element) => element.id == int.parse(transaction.operatorId));
        print("THE TRANSACTION ${transaction.operatorId} ${product?.name}");
        return Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                RepaintBoundary(
                  key: shareglobalKey,
                  child: FittedBox(
                    child: Container(
                      color: Colors.white60,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: DataTable(
                          columns: const [
                            DataColumn(label: Text('')),
                            DataColumn(label: Text('')),
                          ],
                          rows: [
                            DataRow(cells: [
                              const DataCell(Text('Purchase Type')),
                              DataCell(Text(transaction.purchase_type))
                            ]),
                            DataRow(cells: [
                              const DataCell(Text('Product')),
                              DataCell(Text(product!.name.isNotEmpty
                                  ? product.name
                                  : "Product name"))
                            ]),
                            DataRow(cells: [
                              const DataCell(Text('Amount')),
                              DataCell(Text(transaction.amount))
                            ]),
                            const DataRow(cells: [
                              DataCell(Text('Number')),
                              DataCell(Text("something"))
                            ]),
                            DataRow(cells: [
                              const DataCell(Text("Transaction id")),
                              DataCell(Text(transaction.ntransactionId))
                            ]),
                            DataRow(
                              cells: [
                                const DataCell(Text('Status')),
                                DataCell(transaction.success == 0 &&
                                        transaction.purchase_type !=
                                            "successful" &&
                                        transaction.purchase_type != "Electric"
                                    ? const Text(
                                        "Failed",
                                        style: TextStyle(color: Colors.red),
                                      )
                                    : transaction.success == 0 &&
                                            transaction.purchase_type !=
                                                "successful" &&
                                            transaction.purchase_type ==
                                                "Electric"
                                        ? Text("Pending",
                                            style: TextStyle(
                                                color: Colors.yellow[700]))
                                        : transaction.success == 1 &&
                                                transaction.status ==
                                                    "successful"
                                            ? Text('Successful',
                                                style: TextStyle(
                                                    color: Colors.green[700]))
                                            : const Text("Falied",
                                                style: TextStyle(
                                                    color: Colors.red)))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    shareController.captureandImage(shareglobalKey);
                  },
                  child: const Text("Share"),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
