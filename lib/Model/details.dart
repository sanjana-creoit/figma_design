import 'Contacts.dart';

class Contact {
  String? image;
  String? name;
  String? message;
  String? time;
  String? unreadMsg;

  Contact({this.image, this.name, this.message, this.time, this.unreadMsg});
}

class Alphabets {
  String alphabet;
  List<Contacts> contacts;

  Alphabets(this.alphabet, this.contacts);
}
