import 'package:figma_design/Model/Contacts.dart';
import 'package:figma_design/Model/database_helper.dart';
import 'package:get/get.dart';

class ProfilePageController extends GetxController {
  final DatabaseHelper databaseHelper = DatabaseHelper();
  Contacts contacts = Contacts();
  late int? id = contacts.id;

  RxBool isValueUpdate = true.obs;
  RxString name = "".obs;
  RxString imagePath = "".obs;

  @override
  void onInit() {
    databaseHelper.updateContact(contacts);
    super.onInit();
  }
}
