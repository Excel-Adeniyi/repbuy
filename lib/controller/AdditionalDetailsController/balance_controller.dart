import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BalanceController extends GetxController {
  final lastDepositAmount = 0.obs;
  final currentBalance = 0.obs;
  final totalOverallDeposit = 0.obs;
  final newLastDepositAmount = 0.obs;
  final newtotalOverallDeposit = 0.obs;
  final newCurrentBalance = "".obs;

  void calculateNewTotalOverallDeposit(String value) {
    if (value.isNotEmpty) {
      final convertInt = int.parse(value);
      final newAmount = convertInt + totalOverallDeposit.value;
      newtotalOverallDeposit.value = newAmount;
    }
  }

  String numberformat() {
    NumberFormat numberFormat = NumberFormat("#,##0.00", "en_us");
    if (currentBalance.value >= 1000000) {
      double number1m = currentBalance / 1000000;
      return '${number1m.toString()}m';
    } else if (currentBalance.value >= 1000) {
      final formattedNumber = numberFormat.format(currentBalance.value);
      return formattedNumber;
    } else {
      return "${currentBalance.value}";
    }
  }


}
