import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/AirtimeTopUp/airtimeController.dart';
import 'package:shapmanpaypoint/controller/DataBundle/data_bundle.dart';
import 'package:shapmanpaypoint/controller/Effects/on_tap.dart';
import 'package:shapmanpaypoint/controller/Iso/iso_controller.dart';
import 'package:shapmanpaypoint/controller/Loader/loader_controller.dart';
import 'package:shapmanpaypoint/controller/Purchase_successful/purchase_controller.dart';
import 'package:shapmanpaypoint/controller/contact_picker/contact_picker.dart';
import 'package:shapmanpaypoint/controller/electricController.dart';
import 'package:shapmanpaypoint/controller/rechargeController.dart';
import 'package:shapmanpaypoint/controller/utility_controller/utility_controller.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';
import 'package:shapmanpaypoint/utils/responsiveness/buttonWidth.dart';

import '../../controller/validator/airtime_validator.dart';

class UniversalButton extends StatelessWidget {
  final String route;
  final String buttonText;
  final String withIcon;
  const UniversalButton(
      {super.key,
      required this.route,
      required this.buttonText,
      required this.withIcon});

  @override
  Widget build(BuildContext context) {
    final ontapEffectController = Get.put(OnTapEffect());
    Get.put(AirtimeCController());
    Get.put(LoaderController());
    Get.put(IsoController());
    Get.put(PhoneController());
    Get.put(PurchaseResponse());
    Get.put(ContactPickerController());
    Get.put(RechargeController());
    Get.put(DataBundleController());
    Get.put(ElectricController());
    Get.put(UtilityController());
    return Obx(() => AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          // margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
          height: 50,
          width: calculateButtonWidth(context),
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black45, // Shadow color
                  blurRadius: 5.0, // Blur radius
                  offset: Offset(0, 2),
                )
              ],
              border: Border.all(
                  color: const Color.fromARGB(255, 219, 218, 218), width: 1.0),
              gradient: LinearGradient(
                  colors: ontapEffectController.isTapped.value
                      ? isbuttongradient
                      : buttongradient,
                  begin: Alignment.bottomRight,
                  end: Alignment.topCenter),
              borderRadius: BorderRadius.circular(10)),
          child: TextButton(
              onPressed: () {
                ontapEffectController.isTapped.value = true;
                Future.delayed(const Duration(milliseconds: 1000), () {
                  ontapEffectController.isTapped.value = false;
                  Get.delete<AirtimeCController>();
                  Get.delete<IsoController>();
                  Get.delete<PhoneController>();
                  Get.delete<LoaderController>();
                  Get.delete<ContactPickerController>();
                  Get.delete<RechargeController>();
                  Get.delete<PurchaseResponse>();
                  // Get.delete<DataBundleController>();
                  Get.delete<ElectricController>();
                  // Get.delete<UtilityController>();
                  if (route.isNotEmpty) {
                    Get.toNamed(route);
                  }
                });
              },
              child: ontapEffectController.isTapped.value == true
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : withIcon == "yes"
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              buttonText,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.east,
                              color: Colors.white,
                            )
                          ],
                        )
                      : Text(
                          buttonText,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        )),
        ));
  }
}
