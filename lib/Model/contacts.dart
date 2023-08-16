import 'package:figma_design/Model/database_helper.dart';

class Contacts {
  final DatabaseHelper databaseHelper = DatabaseHelper();

  int? id;
  String? image;
  String? firstName;
  String? lastName;
  int? phoneNo;
  String? address;
  String? city;

  Contacts(
      {this.id,
      this.image,
      this.firstName,
      this.lastName,
      this.phoneNo,
      this.address,
      this.city});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNo,
      'address': address,
      'city': city
    };
  }

  @override
  String toString() {
    return toMap().toString();
  }

}
