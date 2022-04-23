import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  late String id;
  late String fullName;
  late String email;
  late int phoneNumber;
  late String address;
  late bool admin;
  late String messID;
  late Timestamp joinedTS;
  late double billAmount;

  Users({
    this.id = "",
    required this.fullName,
    this.email = '',
    required this.phoneNumber,
    required this.address,
    this.messID = '',
    required this.joinedTS,
    this.billAmount = 0,
  });

  Map<String, dynamic> toJSON() => {
        'id': id,
        'fullName': fullName,
        'email': email,
        'phone': phoneNumber,
        'address': address,
        'joinedTS': joinedTS,
        'billAmount': billAmount,
      };

  static Users fromJSON(Map<String, dynamic> json) => Users(
        id: json['id'],
        fullName: json['fullName'],
        email: json['email'],
        phoneNumber: json['phone'],
        address: json['address'],
        messID: json['messID'],
        joinedTS: json['joinedTS'],
      );
}
