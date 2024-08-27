import 'package:get/get.dart';

class CurrencyController extends GetxController {
  var currency = {"": 'currency', "NGN": 'Ngn', "USD": 'Usd'}.obs;
  var currencyValue = "".obs;
  final amount = ''.obs;
}
