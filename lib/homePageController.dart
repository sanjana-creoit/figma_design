import 'package:figma_design/ProfilePage.dart';
import 'package:figma_design/ProfilePageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Model/Details.dart';
import 'package:badges/badges.dart' as badges;

class HomePageController extends GetxController {
  int selectedIndex = 0;
  RxInt currentPageIndex = 0.obs;
  final TextEditingController search = TextEditingController();
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

  Widget chatItem(String image, String name, String message, String time,
      String unreadMsg) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: GestureDetector(
            onTap: () {
              ProfilePageController controller =
                  Get.put(ProfilePageController());
              controller.name.value = name;
              controller.imagePath.value = image;
              Get.to(() => ProfilePage());
            },
            child: Image.asset(
              image,
              height: 56,
              width: 56,
              fit: BoxFit.cover,
            )),
        title: Text(
          name,
          style: const TextStyle(color: Color(0xFF001E2F), fontSize: 16),
        ),
        subtitle: Text(
          message,
          style: const TextStyle(color: Color(0xFF74777F), fontSize: 14),
        ),
        trailing: Column(
          children: [
            Text(
              time,
              style: const TextStyle(fontSize: 12, color: Color(0xFF74777F)),
            ),
            if (unreadMsg != "")
              Padding(
                padding: EdgeInsets.only(left: 16, top: 11),
                child: badges.Badge(
                  badgeStyle: badges.BadgeStyle(badgeColor: Color(0xFF1974E6)),
                  badgeContent: Text(
                    unreadMsg,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
