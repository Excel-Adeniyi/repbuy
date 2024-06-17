import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Screens/serviceScreen/component/giftcard/gift_card.dart';
import 'package:shapmanpaypoint/controller/RealTimeServiceController/websocket/utility_status.dart';
import 'package:shapmanpaypoint/controller/TransactionList/transaction_list_and_balance_controller.dart';
import 'package:shapmanpaypoint/controller/tabcontroller.dart';
import 'package:shapmanpaypoint/services/GiftCard/giftcard_auth.dart';
import '../../Header/header.dart';

class DashboardTab extends StatelessWidget {
  final double containerWidth;

  const DashboardTab({Key? key, required this.containerWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TabbController control = Get.put(TabbController());
    Get.put(UtilityStatusSocket());

    final TransactionListController transactionController =
        Get.put(TransactionListController());
    final authService = GiftCardAuth();
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: transactionController.fetchTransactionList,
        child: Column(
          children: [
            DashboardHeader(),
            Column(
              children: [
                SizedBox(
                  width: containerWidth,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: 130,
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0.6, color: const Color(0xff0a2417)),
                              borderRadius: BorderRadius.circular(5)),
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed('recharge',
                                  arguments: 'Airtime Top up');
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Airtime',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                ),
                                Image.asset(
                                  'lib/assets/calling.png',
                                  width: 40,
                                  color:
                                      const Color(0xff0a2417).withOpacity(0.9),
                                  colorBlendMode: BlendMode.modulate,
                                )
                              ],
                            ),
                          )),
                      Container(
                        width: 130,
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.6, color: const Color(0xff0a2417)),
                            borderRadius: BorderRadius.circular(5)),
                        child: TextButton(
                          onPressed: () {
                            Get.toNamed('data');
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Data Plan',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                              Image.asset(
                                'lib/assets/signal.png',
                                width: 40,
                                color: const Color(0xff0a2417).withOpacity(0.9),
                                colorBlendMode: BlendMode.modulate,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: containerWidth,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: 130,
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0.6, color: const Color(0xff0a2417)),
                              borderRadius: BorderRadius.circular(5)),
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed('/utility');
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Electricity',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                ),
                                Image.asset(
                                  'lib/assets/electricity.png',
                                  width: 40,
                                  color:
                                      const Color(0xff0a2417).withOpacity(0.9),
                                  colorBlendMode: BlendMode.modulate,
                                )
                              ],
                            ),
                          )),
                      Container(
                        width: 130,
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.6, color: const Color(0xff0a2417)),
                            borderRadius: BorderRadius.circular(5)),
                        child: TextButton(
                          onPressed: () {
                            Get.to(GiftCard());
                            authService.auth();
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Gift Card',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                              Image.asset(
                                'lib/assets/gift-card.png',
                                width: 40,
                                color: const Color(0xff0a2417).withOpacity(0.9),
                                colorBlendMode: BlendMode.modulate,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: containerWidth,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: 130,
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0.6, color: const Color(0xff0a2417)),
                              borderRadius: BorderRadius.circular(5)),
                          child: TextButton(
                            onPressed: () {},
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Cable Tv',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                ),
                                Image.asset(
                                  'lib/assets/tv-box.png',
                                  width: 40,
                                  color:
                                      const Color(0xff0a2417).withOpacity(0.9),
                                  colorBlendMode: BlendMode.modulate,
                                )
                              ],
                            ),
                          )),
                      Container(
                        width: 130,
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 0.6, color: const Color(0xff0a2417)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextButton(
                          onPressed: () {
                            control.selectedTab.value = 1;
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'More',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                              Image.asset(
                                'lib/assets/menu.png',
                                width: 40,
                                color: const Color(0xff0a2417).withOpacity(0.9),
                                colorBlendMode: BlendMode.modulate,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: containerWidth,
                  child: const Row(
                    children: [
                      Text('Recent Activities'),
                      Expanded(child: Divider())
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
                            children: [
                              Icon(
                                Icons.cloud,
                                color: Colors.black54,
                              ),
                              Text("No recent activity has be done."),
                            ],
                          ),
                        )),
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: 200,
                      width: containerWidth,
                      child: ListView.separated(
                        itemCount: 10,
                        itemBuilder: (BuildContext context, index) {
                          final transaction = transactions[index];
                          final dateTime =
                              DateTime.parse(transaction.updated_at).toLocal();
                          final localTime = dateTime.toString();
                          return ListTile(
                            title: Text(transaction.purchase_type,
                                style: const TextStyle(
                                    color: Colors.black54, fontSize: 12)),
                            subtitle: Text(
                              localTime,
                              style: const TextStyle(
                                  color: Colors.black54, fontSize: 12),
                            ),
                            trailing: Text(
                              transaction.amount,
                              style: TextStyle(
                                  color: transaction.success == 0 &&
                                          transaction.purchase_type !=
                                              "successful" &&
                                          transaction.purchase_type !=
                                              "Electric"
                                      ? Colors.red
                                      : transaction.success == 0 &&
                                              transaction.purchase_type !=
                                                  "successful" &&
                                              transaction.purchase_type ==
                                                  "Electric"
                                          ? Colors.yellow[700]
                                          : transaction.success == 1 &&
                                                  transaction.status ==
                                                      "successful"
                                              ? Colors.green[700]
                                              : Colors.red),
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
                  }
                }),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
