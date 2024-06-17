import 'package:get/get.dart';
import 'package:shapmanpaypoint/Model/TransactionListModel/transaction_list_model.dart';
import 'package:shapmanpaypoint/services/AddFunds/wallet_balance.dart';
import 'package:shapmanpaypoint/services/TransactionList/transaction_list.dart';

class TransactionListController extends GetxController {
  final RxList<TransactionListModel> recentPurchase =
      <TransactionListModel>[].obs;
  final isLoadingRecentPurchase = false.obs;
  final translistService = TransactionList();
  final currentBalance = WalletBalance();
  @override
  void onInit() {
    super.onInit();
    fetchTransactionList();
  }

  Future<void> fetchTransactionList() async {
    translistService.getTransactionList(recentPurchase);
    currentBalance.getBalance();
  }

  List<TransactionListModel> get transactionList => recentPurchase.toList();
}
