import 'package:cloud_firestore/cloud_firestore.dart';

class Member {
  late String mid;
  late String fullName;
  late String email;
  late int phoneNumber;
  late String address;
  late bool isAdmin;
  late String messID;
  late Timestamp joinedTS;
  final int managerSerial;

  Member({
    this.mid = "",
    required this.fullName,
    this.email = '',
    required this.phoneNumber,
    required this.address,
    this.messID = '',
    required this.joinedTS,
    required this.managerSerial,
  });

  Map<String, dynamic> toMap() => {
        'id': mid,
        'fullName': fullName,
        'email': email,
        'phone': phoneNumber,
        'address': address,
        'joinedTS': joinedTS,
        'managerSerial': managerSerial,
      };

  static Member fromJSON(Map<String, dynamic> json) => Member(
        mid: json['id'],
        fullName: json['fullName'],
        email: json['email'],
        phoneNumber: json['phone'],
        address: json['address'],
        messID: json['messID'],
        joinedTS: json['joinedTS'],
        managerSerial: json['managerSerial'],
      );

  bool isManager() {
    return managerSerial == 1;
  }
}
