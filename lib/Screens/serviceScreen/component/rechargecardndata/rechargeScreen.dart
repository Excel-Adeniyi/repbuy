import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shapmanpaypoint/widgets/balanceTopup/balanceTop.dart';
import 'package:shapmanpaypoint/controller/rechargeController.dart';
import 'package:shapmanpaypoint/utils/colors/coloors.dart';
import 'package:shapmanpaypoint/utils/dialog/dialogShow.dart';

class RechargeCard extends StatelessWidget {
  final String title = Get.arguments;
  final RechargeController imageSelector = Get.put(RechargeController());
  RechargeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth;
    if (screenWidth < 600) {
      containerWidth = 300.0;
    } else if (screenWidth < 1200) {
      containerWidth = 400.0;
    } else {
      containerWidth = 500.0;
    }
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(colors: [
                      Color(0xFF5423bb),
                      Color(0xFF8629b1),
                      Color(0xFFa12cab),
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
                        .createShader(bounds);
                  },
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                TopBalance(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Select Network Provider"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 45,
                          child: TextButton(
                            onPressed: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: const LinearGradient(
                                    colors: buttongradient,
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.bottomRight),
                              ),
                              child: const Icon(
                                Icons.chevron_left,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 45,
                          child: TextButton(
                            onPressed: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: const LinearGradient(
                                    colors: buttongradient,
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.bottomRight),
                              ),
                              child: const Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                if (imageSelector.images.length > 4)
                  Container(
                    height: 70, // Set a fixed height for the list view
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: getImageWidgets(),
                    ),
                  )
                else
                  (const Text('GGG')),
                Container(
                  padding: const EdgeInsets.fromLTRB(2, 7, 2, 7),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      gradient: LinearGradient(
                          colors: buttongradient,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: imageSelector.buttonValue
                          .map((value) => GetBuilder<RechargeController>(
                                  builder: (controller) {
                                return SizedBox(
                                  width: 150,
                                  height: 30,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        color:
                                            controller.selectedButton.value ==
                                                    value
                                                ? Colors.black87
                                                : Colors.white),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          controller
                                              .setSelectButtonValue(value);
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: controller
                                                        .selectedButton.value ==
                                                    value
                                                ? Colors.black87
                                                : Colors.white),
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                              color: controller.selectedButton
                                                          .value ==
                                                      value
                                                  ? Colors.white
                                                  : Colors.purple),
                                        )),
                                  ),
                                );
                              }))
                          .toList()),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  alignment: Alignment.centerRight,
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                              colors: [
                            Color(0xFF5423bb),
                            Color(0xFF8629b1),
                            Color(0xFFa12cab),
                          ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)
                          .createShader(bounds);
                    },
                    child: const Text(
                      'Find Beneficiary',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Phone number',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.contact_phone_sharp,
                          color: Colors.purple,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter Amount',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                  width: containerWidth,
                  height: 40,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45, // Shadow color
                          blurRadius: 5.0, // Blur radius
                          offset: Offset(0, 2),
                        )
                      ],
                      border: Border.all(
                          color: const Color.fromARGB(255, 219, 218, 218),
                          width: 2.0),
                      gradient: const LinearGradient(
                          colors: buttongradient,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      borderRadius: BorderRadius.circular(16)),
                  child: TextButton(
                    onPressed: () {
                      Get.to(Customup(title: title));
                    },
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getImageWidgets() {
    return imageSelector.images.map((image) {
      // final isSelectedObservable = image.isSelected.obs;
      return GestureDetector(
        onTap: () {
          imageSelector.selectImage(image.value);
          print(image.value);
        },
        child: GetBuilder<RechargeController>(
          builder: (controller) {
            return Container(
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                      color: controller.isImageSelected(image.value)
                          ? Colors.purple
                          : Colors.grey,
                      width:
                          controller.isImageSelected(image.value) ? 2 : 0.2)),
              child: Image.asset(
                image.value,
                width: 50,
                height: 30,
              ),
            );
          },
        ),
      );
    }).toList();
  }
}
