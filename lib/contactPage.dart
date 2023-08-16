import 'package:figma_design/AddNewContact.dart';
import 'package:figma_design/ContactPageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Model/Contacts.dart';

class ContactPage extends GetView<ContactPageController> {
  final controller = Get.put(ContactPageController());

  ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getAllContacts();
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("Contacts",
              style: TextStyle(
                  color: Color(0xFF1B1C1F),
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: Color(0xFF001E2F),
                  size: 24,
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
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
                    hintStyle:
                        TextStyle(fontSize: 16, color: Color(0xFF74777F))),
              ),
            ),
            Obx(() {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.alphabets.length,
                  itemBuilder: (context, index) {
                    print("alphabet = ${controller.alphabets[index].alphabet}");
                    return controller.alphabets.isEmpty
                        ? const Center(
                            child: Text(
                            "No Contact Found",
                            style: TextStyle(fontSize: 18),
                          ))
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 34, left: 16, right: 8, bottom: 8),
                                child: Text(
                                  controller.alphabets[index].alphabet,
                                  style: const TextStyle(
                                      color: Color(0xFF1B72C0),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: controller.displayContact(
                                    controller.alphabets[index].contacts,
                                  ),
                                ),
                              ),
                            ],
                          );
                  });
            })
          ],
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
          onPressed: () async {
            var result = await Get.to(() => AddNewContact(),
                arguments: {"isFromProfile": false});
            if(result == true){
              controller.getAllContacts();
            }
          },
          child: const Icon(
            Icons.add,
            size: 24,
            color: Color(0xFF001C38),
          ),
        ),
      ),
    );
  }
}
