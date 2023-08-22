import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import 'Model/Details.dart';
import 'ProfilePage.dart';
import 'ProfilePageController.dart';

class ChatPageController extends GetxController {
  Timer? debounce;
  final TextEditingController search = TextEditingController();
  RxList<Contact> filteredResult = RxList<Contact>([]);
  Contact contact = Contact();
  RxBool isLoading = false.obs;
  RxList<Contact> detailsList = [
    Contact(
        image: "assets/images/img1.png",
        name: "Bryan",
        message: "What do you think?",
        time: "4:30PM",
        unreadMsg: "2"),
    Contact(
        image: "assets/images/image2.png",
        name: "Kari",
        message: "Looks great!",
        time: "4:23PM",
        unreadMsg: "1"),
    Contact(
        image: "assets/images/image3.png",
        name: "Diana",
        message: "Lunch on Monday?",
        time: "4:12PM",
        unreadMsg: ""),
    Contact(
        image: "assets/images/img4.png",
        name: "Ben",
        message: "You sent a photo.",
        time: "3:58PM",
        unreadMsg: ""),
    Contact(
        image: "assets/images/image5.png",
        name: "Naomi",
        message: "Naomi sent a photo.",
        time: "3:31PM",
        unreadMsg: ""),
    Contact(
        image: "assets/images/image6.png",
        name: "Alicia",
        message: "See you at 8.",
        time: "3:30PM",
        unreadMsg: ""),
  ].obs;

  Widget chatItem(Contact contact) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: GestureDetector(
            onTap: () {
              ProfilePageController controller =
                  Get.put(ProfilePageController());
              controller.name.value = contact.name ?? "";
              controller.imagePath.value = contact.image ?? "";
              Get.to(() => ProfilePage(), arguments: {
                "isFromChat": true
              });
            },
            child: Image.asset(
              contact.image ?? "",
              height: 56,
              width: 56,
              fit: BoxFit.cover,
            )),
        title: Text(
          contact.name ?? "",
          style: const TextStyle(color: Color(0xFF001E2F), fontSize: 16),
        ),
        subtitle: Text(
          contact.message ?? "",
          style: const TextStyle(color: Color(0xFF74777F), fontSize: 14),
        ),
        trailing: Column(
          children: [
            Text(
              contact.time ?? "",
              style: const TextStyle(fontSize: 12, color: Color(0xFF74777F)),
            ),
            if (contact.unreadMsg != "")
              Padding(
                padding: EdgeInsets.only(left: 16, top: 11),
                child: badges.Badge(
                  badgeStyle: badges.BadgeStyle(badgeColor: Color(0xFF1974E6)),
                  badgeContent: Text(
                    contact.unreadMsg ?? "",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  void displaySearchList() {
    isLoading.value = true;
    List<Contact> searchResult = List.empty(growable: true);
    if (search.text.isEmpty) {
      searchResult = detailsList;
    } else {
      searchResult = detailsList
          .where((e) => e.name != null && e.name!.contains(search.text))
          .toList();
    }
    filteredResult.value = searchResult;
    filteredResult.refresh();
    print('Search text: ${search.text}');
    print('Filtered result length: ${filteredResult.length}');
    isLoading(false);
  }
}
