import 'dart:async';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'chatsPageController.dart';

class ChatsPage extends GetView<ChatPageController> {
  final controller = Get.put(ChatPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: TextFormField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {
                controller.isLoading(true);
                if (controller.debounce?.isActive ?? false) {
                  controller.debounce?.cancel();
                }
                controller.debounce =
                    Timer(const Duration(milliseconds: 500), () {
                  controller.displaySearchList();
                  Fimber.d("Write Search LIst: ${controller.filteredResult}");
                });
              },
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(Get.context!).unfocus();
        },
        child: Obx(
           () {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: controller.filteredResult.length,
                itemBuilder: (context, index) {
                  Fimber.d("Write Filtered List: ${controller.filteredResult}");
                  return controller.isLoading.isTrue
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : controller.chatItem(controller.filteredResult[index]);
                });
          }
        ),
      ),
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
