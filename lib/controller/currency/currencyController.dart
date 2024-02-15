import 'package:get/get.dart';

class CurrencyController extends GetxController {
  var currency = <String>['Ngn', 'Usd'].obs;
  var currencyValue = 'Ngn'.obs;
  final amount = ''.obs;
}
