import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shapmanpaypoint/controller/rechargeController.dart';

class ContactPickerController extends GetxController {
  // final TextEditingController phoneController = TextEditingController();
  final phonController = Get.put(RechargeController());
  final searchContact = "".obs;
  final RxList<Contact> selectedContacts = <Contact>[].obs;

  Future<void> pickContacts() async {
    // Check and request permissions
    if (await Permission.contacts.request().isGranted) {
      try {
        // Fetch contacts
        final List<Contact> contacts = await ContactsService.getContacts();

        // Show a dialog with a list of contacts to choose from
        final selectedContact = await showDialog<Contact>(
          context: Get.overlayContext!,
          builder: (context) {
            return AlertDialog(
              title: const Text('Choose a Contact'),
              content: SizedBox(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      TextField(
                          decoration: const InputDecoration(
                              labelText: 'search contact'),
                          onChanged: (String newValue) {
                            searchContact.value = newValue;
                          }),
                      Obx(() {
                        // print(searchContact.value);
                        final finalcontact = searchContact.value.isNotEmpty
                            ? contacts.where((contact) {
                                final contactName =
                                    contact.displayName?.toLowerCase() ?? '';

                                return contactName
                                    .contains(searchContact.value);
                              }).toList()
                            : contacts;
                        if (finalcontact.isEmpty) {
                          return const Center(
                            child: Text('No contacts found'),
                          );
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: finalcontact
                              .map(
                                (contact) => ListTile(
                                  title: Text(contact.displayName ?? ''),
                                  onTap: () {
                                    Navigator.of(context).pop(contact);
                                  },
                                ),
                              )
                              .toList(),
                        );
                      })
                    ],
                  ),
                ),
              ),
            );
          },
        );

        // Update the TextField with the selected contact
        if (selectedContact != null) {
          selectedContacts.clear();
          selectedContacts.add(selectedContact);
          // Retrieve the primary phone number of the selected contact
          final phoneNumber = selectedContact.phones?.first.value ?? '';
          phonController.phoneController.text = phoneNumber;
          updateTextField();
        }
      } catch (e) {
        // Handle exceptions (e.g., if contacts permission is denied)
        await showDialog(
          context: Get.overlayContext!,
          builder: (context) {
            return const AlertDialog(
              // title: Text('Choose a Contact'),
              content: SizedBox(
                height: 100,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                      ),
                      Center(
                        child: Text("Error fetching contacts"),
                      )
                    ]),
              ),
            );
          },
        );
      }
    } else {
      // Handle case where contacts permission is denied
      await showDialog(
        context: Get.overlayContext!,
        builder: (context) {
          return const AlertDialog(
            // title: Text('Contacts permission is denied'),
            content: SizedBox(
              height: 100,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                    ),
                    Center(
                      child: Text("Contacts permission is denied"),
                    )
                  ]),
            ),
          );
        },
      );
    }
  }

  void updateTextField() {
    phonController.phoneController.text = phonController.phoneController.text;
  }
}
