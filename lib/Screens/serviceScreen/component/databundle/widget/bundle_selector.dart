import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shapmanpaypoint/controller/DataBundle/data_bundle.dart';

class BundleSelector extends StatelessWidget {
  const BundleSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final DataBundleController databundleController =
        Get.find<DataBundleController>();
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              width: 1.0, color: const Color.fromARGB(255, 73, 22, 105))),
      height: 50,
      // width: 200,
      child: GetBuilder<DataBundleController>(builder: (controller) {
        if (databundleController.selectedPName.value.isNotEmpty &&
            databundleController.selectedPName.value != "Select Provider") {
          return Obx(
            () {
              print("Yap ${databundleController.selectedPName.value}");

              // print(mutableLogo);
              return DropdownButton<String>(
                padding: const EdgeInsets.all(8.0),
                isExpanded: true,
                value: databundleController.selectedFixedAmountDes.value,
                items: [
                  const DropdownMenuItem<String>(
                    value: "00.0",
                    child: Text("Data bundles"),
                  ),
                  // Check if the list is not null

                  ...databundleController.dropdownItems
                      .map<DropdownMenuItem<String>>(
                        (item) {
                          return DropdownMenuItem<String>(
                            value: item.key.toString(),
                            child: Text(
                              item.value ?? "Unknown",
                              softWrap: true,
                              overflow: TextOverflow.clip,
                            ),
                          );
                        },
                      )
                      .toSet()
                      .toList(),
                ],
                onChanged: (dynamic? newValue) {
                  // Handle dropdown value change if needed
                  print("NATHEM $newValue");
                  if (newValue == null || newValue.isEmpty) {
                    // Set newValue to the default value
                    newValue =
                        "Default Value"; // Replace "Default Value" with your desired default value
                  }

                  databundleController.selectedFixedAmountDes.value = newValue;
                  databundleController.priceController.text = newValue;
                  print(newValue);
                  databundleController.findPriceValueCurrency();
                },
              );
            },
          );
        } else {
          return const SizedBox(
            width: double.infinity,
          );
        }
      }),
    );
  }
}
