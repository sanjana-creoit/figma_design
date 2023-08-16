import 'package:figma_design/AddNewContact.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Model/Contacts.dart';
import 'ProfilePageController.dart';

class ProfilePage extends GetView<ProfilePageController> {
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF001E2F), size: 24),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: PopupMenuButton(
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                      value: 0,
                      child: Text(
                        "Edit",
                        style: TextStyle(fontSize: 18),
                      )),
                  const PopupMenuItem(
                      value: 1,
                      child: Text(
                        "Delete",
                        style: TextStyle(fontSize: 18),
                      ))
                ];
              },
              onSelected: (value) async{
                if (value == 0) {
                   var result = await Get.to(() => AddNewContact(), arguments: {
                    "contacts": controller.contacts,
                    "isFromProfile": true,
                  });
                   if(result == true){
                     controller.databaseHelper.updateContact(controller.contacts);
                   }
                } else if (value == 1) {
                  controller.databaseHelper
                      .deleteContact(controller.contacts.id ?? 0);
                }
              },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            controller.contacts.image == null
                ? Image.asset(
                    "assets/images/contact.png",
                    height: 120,
                    width: 120,
                    fit: BoxFit.contain,
                  )
                : Image.asset(
                    '${controller.contacts.image}',
                    height: 120,
                    width: 120,
                    fit: BoxFit.contain,
                  ),
            Padding(
              padding: EdgeInsets.only(top: 24),
              child: Text(
                "${controller.contacts.firstName}",
                style: TextStyle(fontSize: 32, color: Color(0xFF001E2F)),
              ),
            ),
            Text(
              "${(controller.contacts.phoneNo)}",
              style: TextStyle(color: Color(0xFF74777F), fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: CircleAvatar(
                          backgroundColor: const Color(0xFF1B72C0),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit_outlined,
                              size: 24,
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Message",
                          style:
                              TextStyle(fontSize: 14, color: Color(0xFF1B72C0)),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: CircleAvatar(
                          backgroundColor: const Color(0xFF1B72C0),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.call,
                              size: 24,
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Call",
                          style:
                              TextStyle(fontSize: 14, color: Color(0xFF1B72C0)),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: CircleAvatar(
                          backgroundColor: Color(0xFF1B72C0),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notifications_outlined,
                              size: 24,
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Mute",
                          style:
                              TextStyle(fontSize: 14, color: Color(0xFF1B72C0)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "More actions",
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF1B72C0),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.photo_outlined,
                          size: 24,
                          color: Color(0xFF1B72C0),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Text(
                            "View media",
                            style: TextStyle(
                                color: Color(0xFF001E2F), fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          size: 24,
                          color: Color(0xFF1B72C0),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Text(
                            "Search in conversation",
                            style: TextStyle(
                                color: Color(0xFF001E2F), fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.notifications_outlined,
                          size: 24,
                          color: Color(0xFF1B72C0),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Text(
                            "Notifications",
                            style: TextStyle(
                                color: Color(0xFF001E2F), fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
