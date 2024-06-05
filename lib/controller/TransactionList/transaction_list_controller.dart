import 'package:get/get.dart';
import 'package:shapmanpaypoint/Model/TransactionListModel/transaction_list_model.dart';
import 'package:shapmanpaypoint/services/TransactionList/transaction_list.dart';

class TransactionListController extends GetxController {
  final RxList<TransactionListModel> recentPurchase =
      <TransactionListModel>[].obs;
  final isLoadingRecentPurchase = false.obs;
  final translistService = TransactionList();
  @override
  void onInit() {
    super.onInit();
    translistService.getTransactionList(recentPurchase);
  }

  List<TransactionListModel> get transactionList => recentPurchase.toList();
}
