import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/Model/rechargeModel/rechargeModel.dart';
import 'package:shapmanpaypoint/utils/flutter_storage/flutter_storage.dart';

class RechargeController extends GetxController {
  final List<ImageModel> images = [
    const ImageModel(value: 'lib/assets/airtime/mtn.png', isSelected: false),
    const ImageModel(value: 'lib/assets/airtime/Airtel.jpg', isSelected: false),
    const ImageModel(value: 'lib/assets/airtime/glo.png', isSelected: false),
    const ImageModel(
        value: 'lib/assets/airtime/9mobile.png', isSelected: false),
    const ImageModel(
        value: 'lib/assets/airtime/vodafone.png', isSelected: false),
    const ImageModel(
        value: 'lib/assets/airtime/fonercell.png', isSelected: false),
    const ImageModel(value: 'lib/assets/airtime/bim.png', isSelected: false),
  ].obs;

  final List<String> buttonValue = ['Buy for Self', 'Gift a Friend'].obs;
  var selectedButton = ''.obs;

  final SecureStorage stora = SecureStorage();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController amountCont = TextEditingController();
  void setSelectButtonValue(String value) async {
    if (value == 'Buy for Self') {
      final tokenAll = await stora.readSecureData('ResBody');
      // print(tokenAll);
      if (tokenAll.isNotEmpty) {
        try {
          // var sStrong = json.encoder(tokenAll);
          Map<String, dynamic> decodedJson = json.decode(tokenAll);
          final decodedS = decodedJson['phone_number'];
          selectedButton.value = value;
          phoneController.text = decodedS;
          update();
          // print('Email: $decodedS');
        } catch (e) {
          print('Error decoding JSON: $e');
        }
      }
    } else {
      selectedButton.value = value;
      update();
    }
  }

  String? selectedValue;

  bool isImageSelected(String imageValue) {
    final selectedImage =
        images.firstWhere((image) => image.value == imageValue);
    return selectedImage.isSelected;
  }

  void selectImage(String selectedValue) {
    final selectedIndex =
        images.indexWhere((image) => image.value == selectedValue);

    if (selectedIndex >= 0 && selectedIndex < images.length) {
      for (var i = 0; i < images.length; i++) {
        final updatedImage = images[i].copyWith(isSelected: i == selectedIndex);
        images[i] = updatedImage;
      }
      selectedValue = selectedValue;
    } else {
      // Handle the case when the selectedValue is not found
    }

    update();
  }
}
