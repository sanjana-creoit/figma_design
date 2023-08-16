import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Model/Contacts.dart';
import 'Model/database_helper.dart';

class NewContactController extends GetxController {

  @override
  void onInit() {
    isFromProfile = Get.arguments['isFromProfile'];
    if (isFromProfile == true) {
      contacts = Get.arguments['contacts'];
      print("Write FIRSTNAME :$contacts");
      selectedValue.value = contacts.image;
      firstName.text = contacts.firstName!;
      lastName.text = contacts.lastName!;
      phoneNumber.text = (contacts.phoneNo).toString();
      address.text = contacts.address!;
      city.text = contacts.city!;
    }
    super.onInit();
  }

  RxList<String> image = [
    "assets/images/pic2.png",
    "assets/images/pic1.png",
    'assets/images/img4.png',
    "assets/images/img1.png",
  ].obs;
   Rxn selectedValue = Rxn();
  bool isFromProfile = false;
  final DatabaseHelper databaseHelper = DatabaseHelper();
  Contacts contacts = Contacts();
  final formKey = GlobalKey<FormState>();
  final secondKey = GlobalKey<FormState>();
  final phoneNo = GlobalKey<FormState>();
  final location = GlobalKey<FormState>();
  final present = GlobalKey<FormState>();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController city = TextEditingController();

}
