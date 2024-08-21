import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shapmanpaypoint/controller/DataBundle/data_bundle.dart';
import 'package:dropdown_search/dropdown_search.dart';

class ProviderSelector extends StatelessWidget {
  const ProviderSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final DataBundleController databundleController =
        Get.find<DataBundleController>();
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: const Color(0xff0a2417)),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      height: 65,
      width: double.infinity,
      child: Obx(
        () => DropdownSearch<String>(
            popupProps: const PopupProps.menu(
              showSearchBox: true,
            ),
            items: databundleController.selectPackkage
                .map<String>((item) => item.name)
                .toList(),
            dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.all(8.0),
              border: InputBorder.none,
            )),
            onChanged: (dynamic newValue) {
              databundleController.selectedPName.value = newValue as String;
              // print(newValue);
              databundleController.selectedFixedAmountDes.value = "00.0";
              final selectedPackage =
                  databundleController.selectPackkage.firstWhere((data) {
                if (data.operatorId != 0) {
                  return data.name.toString() ==
                      databundleController.selectedPName.value;
                } else {
                  null;
                  return false;
                }
              });

              if (selectedPackage.name.isNotEmpty) {
                // Update the selected country name
                final String mutableProvider = selectedPackage.name;

                databundleController.selectedPackageName.value =
                    mutableProvider;
                final mutableLogo = List<String>.from(selectedPackage.logoUrls);
                databundleController.selectedLogoUrls.value = mutableLogo[0];

                final mutableDb = Map<String, dynamic>.from(
                    selectedPackage.fixedAmountsDescriptions);

                databundleController.updateDropdownItems(mutableDb);
              }
            },


            dropdownBuilder: (context, String? selectedItem) {
              final packName = selectedItem ?? "Select Provider";
              if (databundleController.selectPackkage.isEmpty) {
                return const Text(
                    "Select provider"); // Show a loading text if data isn't ready
              }
              final selectedPackage =
                  databundleController.selectPackkage.firstWhere(
                (item) => item.name == packName,
                // orElse: () => null,
              );
              // print('here $selectedItem');
              if (selectedPackage.name.isEmpty) {
                return const Text(
                    "Select provider"); // Show default text if no package found
              }
              return Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (selectedPackage.logoUrls.isNotEmpty) ...[
                      Image.network(
                        selectedPackage.logoUrls[0],
                        width: 50,
                        height: 50,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.error),
                      ),
                      const SizedBox(width: 1),
                    ],
                    Center(child: Text(selectedItem ?? "Select provider")),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
