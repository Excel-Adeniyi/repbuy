import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();
  final RxString country = ''.obs;
  final RxBool terms = false.obs;
  final RxBool firstnameValidator = false.obs;
  final RxBool lastnameValidator = false.obs;
  final RxBool emailValidator = false.obs;
  final RxBool phoneValidator = false.obs;
  final RxBool passwordValidator = false.obs;
  final RxBool confirmpasswordValidator = false.obs;
  final RxBool isVisible = true.obs;
  final RxBool isLoading = false.obs;
  final RxBool isCreated = false.obs;
  final TextEditingController pincontroller = TextEditingController();

  void onChangedValue() {
    print(terms.value);
    print(confirmpasswordValidator.value);
    if (firstname.text.isNotEmpty &&
        lastname.text.isNotEmpty &&
        email.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        password.text.isNotEmpty &&
        confirmpassword.text.isNotEmpty &&
        country.value.isNotEmpty &&
        terms.value == false &&
        confirmpasswordValidator.value == false) {
      print("HI");
      isVisible.value = false;
    } else {
      isVisible.value = true; // Reset visibility if any field is cleared
      print("NAN");
    }
  }
}
