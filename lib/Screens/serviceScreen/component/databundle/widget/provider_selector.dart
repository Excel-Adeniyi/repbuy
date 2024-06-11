import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/DataBundle/data_bundle.dart';

class ProviderSelector extends StatelessWidget {
  const ProviderSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final DataBundleController databundleController =
        Get.find<DataBundleController>();
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              width: 1.0, color: const Color(0xff0a2417)),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      height: 65,
      width: double.infinity,
      child: Obx(
        () => DropdownButton<String>(
          elevation: 0,
          underline: const SizedBox(),
          padding: const EdgeInsets.all(8.0),
          isExpanded: true,
          value: databundleController.selectedPName.value,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: [
            const DropdownMenuItem<String>(
              value: "Select Provider",
              child: Text("Select Provider"),
            ),
            // Check if the list is not null
            ...databundleController.selectPackkage
                .map<DropdownMenuItem<String>>(
                  (item) {
                    return DropdownMenuItem<String>(
                      value: item.operatorId.toString(),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(child: Text(item.name)),
                          FadeInImage.assetNetwork(
                            placeholder: 'lib/assets/logo.png',
                            image: item.logoUrls[0],
                            width: 50,
                            height: 50,
                          )
                        ],
                      ),
                    );
                  },
                )
                .toSet()
                .toList(),
          ],
          onChanged: (dynamic? newValue) {
            databundleController.selectedPName.value = newValue as String;
            databundleController.selectedFixedAmountDes.value = "00.0";
            final selectedPackage =
                databundleController.selectPackkage.firstWhere((data) {
              if (data != null && data.operatorId != null) {
                return data.operatorId.toString() ==
                    databundleController.selectedPName.value;
              } else {
                null;
                return false;
              }
            });

            if (selectedPackage != false) {
              // Update the selected country name
              final String mutableProvider = selectedPackage.name;
              // print("CHECKER $mutableProvider");
              databundleController.selectedPackageName.value = mutableProvider;
              final mutableLogo = List<String>.from(selectedPackage.logoUrls);
              databundleController.selectedLogoUrls.value = mutableLogo[0];

              final mutableDb = Map<String, dynamic>.from(
                  selectedPackage.fixedAmountsDescriptions);

              databundleController.updateDropdownItems(mutableDb);
            }
          },
        ),
      ),
    );
  }
}
