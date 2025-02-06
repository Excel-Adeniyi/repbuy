import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Screens/Dashboard/Header/header.dart';
import 'package:shapmanpaypoint/controller/Jsonloader_controller/jsonloader_controller.dart';
import 'package:shapmanpaypoint/controller/RealTimeServiceController/websocket/utility_status.dart';
import 'package:shapmanpaypoint/controller/TransactionList/transaction_list_and_balance_controller.dart';
import 'package:shapmanpaypoint/services/GiftCard/giftcard_auth.dart';

import '../../../../controller/tabcontroller.dart';

class DashboardTab extends StatelessWidget {
  final double containerWidth;

  const DashboardTab({super.key, required this.containerWidth});

  @override
  Widget build(BuildContext context) {
    final tabbController = Get.put(TabbController());
    final buttonsController = Get.put(ScreenButtonsController());
    print('DATA VALUES ${buttonsController.data}');
    Get.put(UtilityStatusSocket());
    final transactionController = Get.find<TransactionListController>();
    final authService = GiftCardAuth();

    return SafeArea(
      child: RefreshIndicator(
        onRefresh: transactionController.fetchTransactionList,
        child: Obx(
          () => SingleChildScrollView(
            child: Column(
              children: [
                DashboardHeader(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1.6),
                    itemCount: buttonsController.data.length,
                    itemBuilder: (context, index) {
                      final item = buttonsController.data[index];
                      print('PRINT ITEM $item');
                      return Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.6,
                            color: const Color(0xff0a2417),
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (item['name'] == 'Gift Card') {
                              print('GIFTCARD');
                              authService.auth();
                            }
                            Get.toNamed(item['page_route'],
                                arguments: item['argument']);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                item['name'],
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                              Image.asset(
                                item['image_url'],
                                width: 20,
                                height: 20,
                                color: const Color(0xff0a2417).withOpacity(0.9),
                                colorBlendMode: BlendMode.modulate,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: containerWidth,
                  child: Row(
                    children: [
                      const Text('Recent Activities',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const Expanded(child: Divider()),
                    ],
                  ),
                ),
                Obx(() {
                  final transactions = transactionController.recentPurchase;

                  if (transactions.isEmpty) {
                    return SizedBox(
                      width: containerWidth,
                      child: const Card(
                        elevation: 8.0,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.cloud, color: Colors.black54),
                                SizedBox(height: 8),
                                Text("No recent activity has been done."),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }

                  return SizedBox(
                    height: 200,
                    width: containerWidth,
                    child: ListView.separated(
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        final transaction = transactions[index];
                        final dateTime =
                            DateTime.parse(transaction.updated_at).toLocal();
                        final localTime = dateTime.toString();
                        final amountColor = (transaction.success == 0 &&
                                transaction.purchase_type != "successful")
                            ? (transaction.purchase_type == "Electric"
                                ? Colors.yellow[700]
                                : Colors.red)
                            : (transaction.success == 1 &&
                                    transaction.status == "successful"
                                ? Colors.green[700]
                                : Colors.red);

                        return ListTile(
                          title: Text(
                            transaction.purchase_type,
                            style: const TextStyle(
                                color: Colors.black54, fontSize: 12),
                          ),
                          subtitle: Text(
                            localTime,
                            style: const TextStyle(
                                color: Colors.black54, fontSize: 12),
                          ),
                          trailing: Text(
                            transaction.amount,
                            style: TextStyle(color: amountColor),
                          ),
                          onTap: () {
                            if (transaction.purchase_type == "Electric") {
                              Get.toNamed('/singlePurchase',
                                  arguments: transaction);
                            }
                          },
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                    ),
                  );
                }),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
