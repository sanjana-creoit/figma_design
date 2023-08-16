import 'package:figma_design/HomePageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatsPage extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: TextFormField(
              controller: controller.search,
              decoration: const InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 24,
                    color: Color(0xFF74777F),
                  ),
                  hintText: "Search",
                  hintStyle: TextStyle(fontSize: 16, color: Color(0xFF74777F))),
            ),
          )),
      body: ListView.builder(
          itemCount: controller.detailsList.length,
          itemBuilder: (context, index) {
            return controller.chatItem(
                controller.detailsList[index].image ?? "",
                controller.detailsList[index].name ?? "",
                controller.detailsList[index].message ?? "",
                controller.detailsList[index].time ?? "",
                controller.detailsList[index].unreadMsg ?? "");
          }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16, right: 16),
        child: FloatingActionButton(
          backgroundColor: const Color(0xFFD3E4FF),
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          onPressed: () {},
          child: const Icon(
            Icons.edit_outlined,
            size: 24,
            color: Color(0xFF001C38),
          ),
        ),
      ),
    );
  }
}
