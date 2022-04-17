import 'package:cloud_firestore/cloud_firestore.dart';

class Admin {
  late String id;
  late String fullName;
  late String email;
  late int phoneNumber;
  late String address;
  late String messName;
  late Timestamp joinedTS;

  Admin({
    this.id = "",
    required this.fullName,
    this.email = '',
    required this.phoneNumber,
    required this.address,
    this.messName = '',
    required this.joinedTS,
  });

  Map<String, dynamic> toJSON() => {
        'id': id,
        'fullName': fullName,
        'email': email,
        'phone': phoneNumber,
        'address': address,
        'messName': messName,
        'joinedTS': joinedTS,
      };

  static Admin fromJSON(Map<String, dynamic> json) => Admin(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      phoneNumber: json['phone'],
      address: json['address'],
      messName: json['messName'],
      joinedTS: json['joinedTS']);
}
