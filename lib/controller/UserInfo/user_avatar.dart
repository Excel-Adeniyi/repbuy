import 'dart:convert';

import 'package:get/get.dart';
import 'package:shapmanpaypoint/utils/flutter_storage/flutter_storage.dart';

class UserImage extends GetxController {
  final stora = SecureStorage();
  RxString userImage = "".obs;
  @override
  void onInit() {
    super.onInit();
    userprofileimage();
  }

  Future<void> userprofileimage() async {
    final image = await stora.readSecureData("ResBody");
    if (image != null && image.isNotEmpty) {
      try {
        // var sStrong = json.encoder(tokenAll);
        Map<String, dynamic> decodedJson = json.decode(image);
        final decodedS = decodedJson['avatar'];
        userImage.value = decodedS;
        print(decodedS);
        update();
        // print('Email: $decodedS');
      } catch (e) {
        print('Error decoding JSON: $e');
      }
    }
  }
}
