import 'package:get/get.dart';
import 'package:shapmanpaypoint/Model/rechargeModel/rechargeModel.dart';

class ElectricController extends GetxController {
  final List<ImageModel> images = [
    const ImageModel(
        value: 'lib/assets/electric/abujadc.jpg', isSelected: false),
    const ImageModel(value: 'lib/assets/electric/BEDC.jpg', isSelected: false),
    const ImageModel(value: 'lib/assets/electric/EEDC.jpg', isSelected: false),
    const ImageModel(value: 'lib/assets/electric/ekedc.png', isSelected: false),
    const ImageModel(
        value: 'lib/assets/electric/ikejadc.png', isSelected: false),
    const ImageModel(value: 'lib/assets/electric/JEDC.png', isSelected: false),
    const ImageModel(value: 'lib/assets/electric/kadu.jpg', isSelected: false),
    const ImageModel(
        value: 'lib/assets/electric/Kedco-spon.jpg', isSelected: false),
    const ImageModel(value: 'lib/assets/electric/PHED.png', isSelected: false),
  ].obs;
  final List<String> buttonValue = ['Buy for Self', 'Gift a Friend'].obs;
  var selectedButton = ''.obs;

  void setSelectButtonValue(String newValue) {
    selectedButton.value = newValue;
    update();
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
