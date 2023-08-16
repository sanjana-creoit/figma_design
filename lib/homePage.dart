import 'package:figma_design/ChatsPage.dart';
import 'package:figma_design/ContactPage.dart';
import 'package:figma_design/SettingsPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ContactPageController.dart';
import 'HomePageController.dart';

class HomePage extends GetView<HomePageController> {
  final PageController _pageController = PageController(initialPage: 0);

  HomePage({super.key});

  Widget buildPageView() {
    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[ChatsPage(), ContactPage(), const SettingsPage()],
    );
  }

  @override
  final controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          bottomNavigationBar: NavigationBar(
            backgroundColor: Colors.white,
            selectedIndex: controller.currentPageIndex.value,
            onDestinationSelected: (int index) {
              controller.currentPageIndex.value = index;
              bottomTapped(index);
            },
            destinations: <Widget>[
              const NavigationDestination(
                selectedIcon: Icon(
                  Icons.home_filled,
                  color: Colors.black,
                ),
                icon: Icon(
                  Icons.home_outlined,
                  color: Color(0xFF44474E),
                ),
                label: 'Chats',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.group),
                icon: (Image.asset(
                  "assets/images/icon.png",
                  height: 24,
                  width: 24,
                )),
                label: 'Contacts',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.settings_rounded),
                icon: (Image.asset(
                  "assets/images/icon3.png",
                  height: 24,
                  width: 24,
                )),
                label: 'Settings',
              ),
            ],
          ),
          body: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              pageChanged(index);
              if(index == 1){
                Get.put(ContactPageController());
              }
            },
            children: [ChatsPage(), ContactPage(), SettingsPage()],
          ));
    });
  }

  void pageChanged(int index) {
    controller.currentPageIndex.value = index;
  }

  void bottomTapped(int index) {
    controller.currentPageIndex.value = index;
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 200), curve: Curves.bounceIn);
  }
}
