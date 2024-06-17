import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/TransactionList/transaction_list_and_balance_controller.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';
import 'package:shapmanpaypoint/utils/width.dart';

import '../Dashboard/Header/header.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TransactionListController transactionController =
        Get.put(TransactionListController());
    return SingleChildScrollView(
      child: Column(
        children: [
          DashboardHeader(),
          SizedBox(
            width: calculateContainerWidth(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [Colors.white, Colors.grey]),
                          border: Border.all(width: 1.0, color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45, // Shadow color
                              blurRadius: 5.0, // Blur radius
                              offset: Offset(0, 2),
                            )
                          ]),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return const LinearGradient(
                                      colors: buttongradient,
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft)
                                  .createShader(bounds);
                            },
                            child: const Text(
                              'Fund Wallet',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 27, 23, 23)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.add,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 150,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: buttongradient,
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft),
                          border: Border.all(width: 1.0, color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45, // Shadow color
                              blurRadius: 5.0, // Blur radius
                              offset: Offset(0, 2),
                            )
                          ]),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'My Card',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: calculateContainerWidth(context),
                  child: const Row(
                    children: [
                      Text('Recent Activities'),
                      Expanded(child: Divider())
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() {
                  final transactions = transactionController.recentPurchase;

                  if (transactions.isEmpty) {
                    return SizedBox(
                      width: calculateContainerWidth(context),
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
                      height: 400,
                      width: calculateContainerWidth(context),
                      child: ListView.separated(
                        itemCount: transactions.length,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
