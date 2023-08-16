import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'NewContactController.dart';

class AddNewContact extends GetView<NewContactController> {
  final controller = Get.put(NewContactController());
  String? contacts;

 bool result =  false;

  AddNewContact({super.key, this.contacts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF001E2F), size: 24),
        title: const Text(
          'New Contact',
          style: TextStyle(color: Color(0xFF001E2F), fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              return Container(
                  height: 150,
                  width: 150,
                  child: controller.selectedValue.value == null
                      ? const Icon(
                          Icons.add_photo_alternate_outlined,
                          size: 24,
                        )
                      : Image.asset(
                          controller.selectedValue.value ?? "",
                          fit: BoxFit.cover,
                        ));
            }),
            Obx(() {
              return
                Container(
                  width: 200,
                  child: DropdownButtonFormField(items: controller.image
                    .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
              ))
                    .toList(),
                  hint: Text("Select Image"),
                  value: controller.selectedValue.value,
                  onChanged: (value) {
                  print('$value');
                  controller.selectedValue.value = value;
                  controller.update();
              },),
                );
            }),
            Form(
                key: controller.formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    controller: controller.firstName,
                    decoration: InputDecoration(
                        icon: const Icon(
                          Icons.person_outline,
                          size: 24,
                          color: Color(0xFF001E2F),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        hintText: "First Name"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter Name";
                      } else {
                        return null;
                      }
                    },
                  ),
                )),
            Form(
                key: controller.secondKey,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(54, 16.0, 16, 16),
                  child: TextFormField(
                    controller: controller.lastName,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        hintText: "Last Name"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter Name";
                      } else {
                        return null;
                      }
                    },
                  ),
                )),
            Form(
                key: controller.phoneNo,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: controller.phoneNumber,
                    decoration: InputDecoration(
                        icon: const Icon(
                          Icons.phone,
                          size: 24,
                          color: Color(0xFF001E2F),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        hintText: "Phone Number"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a mobile Number";
                      } else if (value.length > 10) {
                        return "Please enter a valid mobile Number";
                      } else {
                        return null;
                      }
                    },
                  ),
                )),
            Form(
                key: controller.location,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: controller.address,
                    decoration: InputDecoration(
                        icon: const Icon(
                          Icons.location_on_outlined,
                          size: 24,
                          color: Color(0xFF001E2F),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        hintText: "Address"),
                  ),
                )),
            Form(
                key: controller.present,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(54, 16.0, 16, 16),
                  child: TextFormField(
                    controller: controller.city,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        hintText: "City"),
                  ),
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD3E4FF),
                    fixedSize: Size(150, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                onPressed: () async {
                  if (controller.formKey.currentState!.validate() &&
                      controller.phoneNo.currentState!.validate()) {
                    controller.contacts.image = controller.selectedValue.value;
                    controller.contacts.firstName = controller.firstName.text;
                    controller.contacts.lastName = controller.lastName.text;
                    controller.contacts.phoneNo =
                        int.tryParse(controller.phoneNumber.text);
                    controller.contacts.address = controller.address.text;
                    controller.contacts.city = controller.city.text;
                    await controller.databaseHelper
                        .insertContact(controller.contacts);
                  if(controller.isFromProfile == true){
                    Get.back(result: controller.contacts);
                  }else{
                    Get.back(result: true);
                  }
                  }
                },
                child: const Text(
                  "Submit",
                  style: TextStyle(
                      color: Color(0xFF001C38), letterSpacing: 1, fontSize: 16),
                ))
          ],
        ),
      ),
    );
  }
}
