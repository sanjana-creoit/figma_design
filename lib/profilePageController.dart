import 'package:figma_design/Model/Contacts.dart';
import 'package:figma_design/Model/database_helper.dart';
import 'package:get/get.dart';
import 'Model/Details.dart';


class ProfilePageController extends GetxController {
  final DatabaseHelper databaseHelper = DatabaseHelper();
  Contacts contacts = Contacts();
 Contact contact = Contact();
  late int? id = contacts.id;

  RxBool isValueUpdate = false.obs;
  RxString name = "".obs;
  RxString imagePath = "".obs;
  RxString phoneNo = "".obs;

  bool isFromChat = false;
  @override
  void onInit() {
    databaseHelper.updateContact(contacts);
    super.onInit();
  }


}