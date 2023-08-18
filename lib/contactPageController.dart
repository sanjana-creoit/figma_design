import 'dart:async';
import 'package:figma_design/Model/database_helper.dart';
import 'package:figma_design/ProfilePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Model/Contacts.dart';
import 'Model/Details.dart';
import 'ProfilePageController.dart';

class ContactPageController extends GetxController {
  final DatabaseHelper databaseHelper = DatabaseHelper();
  Contacts contacts = Contacts();
  RxBool isLoading = false.obs;

  Timer? debounce;
  List<Contacts> filteredResult = List.empty(growable: true);

  @override
  void dispose() {
    debounce?.cancel();
    super.dispose();
  }


  @override
  onInit() async {
    databaseHelper.getAllContact();
    print("Contact List ...");
    super.onInit();
  }

  final TextEditingController search = TextEditingController();
  RxList<Contacts> contactList = RxList.empty(growable: true);

  RxList<Alphabets> alphabets = RxList.empty(growable: true);

  Widget displayContact(List<Contacts> contactList) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: contactList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              ProfilePageController profilePageController =
                  Get.put(ProfilePageController());
              profilePageController.contacts = contactList[index];
              var result = await Get.to(() => ProfilePage());
              if (result == true) {
                getAllContacts();
              }
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    contactList[index].image ?? "assets/images/contact.png",
                    height: 40,
                    width: 40,
                  ),
                ),
                Text(
                  contactList[index].firstName ?? "",
                  style:
                      const TextStyle(color: Color(0xFF001E2F), fontSize: 16),
                )
              ],
            ),
          );
        });
  }

  void getAllContacts() async {
    contactList.value = await databaseHelper.getAllContact();
    print("WRITE CONTACT LIST: $contactList");
    contactList.refresh();
    alphabets.value =
        List.generate(26, (index) => String.fromCharCode(index + 65))
            .map((e) =>
                contactList.any((c) => c.firstName?.startsWith(e) == true)
                    ? Alphabets(
                        e,
                        contactList
                            .where((cl) => cl.firstName?.startsWith(e) == true)
                            .toList())
                    : null)
            .toList()
            .where((element) => element != null)
            .map((e) => e as Alphabets)
            .toList();
    alphabets.refresh();
    print("alphabets length = ${alphabets.length}");
  }

  void displaySearchItem() {
    List<Contacts> searchResult = [];
    if (search.text.isEmpty) {
      searchResult = contactList;
    } else {
      searchResult = contactList
          .where((e) => e.firstName != null && e.firstName!.contains(search.text))
          .toList();
    }
    filteredResult = searchResult;
    alphabets.value =
        List.generate(26, (index) => String.fromCharCode(index + 65))
            .map((e) =>
        filteredResult.any((c) => c.firstName?.startsWith(e) == true)
            ? Alphabets(
            e,
            filteredResult
                .where((cl) => cl.firstName?.startsWith(e) == true)
                .toList())
            : null)
            .toList()
            .where((element) => element != null)
            .map((e) => e as Alphabets)
            .toList();
    alphabets.refresh();
    print("alphabets length = ${alphabets.length}");
    print("FILTERED RESULT: $filteredResult");
  }
}
