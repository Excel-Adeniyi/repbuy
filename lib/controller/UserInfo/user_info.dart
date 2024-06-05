import 'package:get/get.dart';
import 'package:shapmanpaypoint/utils/flutter_storage/flutter_storage.dart';

class UserInfoController extends GetxController {
  RxString first_name = ''.obs;
  RxString last_name = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxInt exp = 0.obs;
}
