import 'package:cloud_firestore/cloud_firestore.dart';

class Mess {
  late String messCode;
  late String messName;
  late String manager;
  late String location;
  late Timestamp joinedTS;
  late num phoneNumber;

  Mess({
    required this.messCode,
    required this.messName,
    required this.manager,
    required this.location,
    required this.joinedTS,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJSON() => {
        'messID': messCode,
        'messName': messName,
        'owner': manager,
        'location': location,
        'joinedDT': joinedTS,
        'phoneNumber': phoneNumber,
      };

  static Mess fromJSON(Map<String, dynamic> json) {
    return Mess(
      messCode: json['messCode'],
      messName: json['messName'],
      manager: json['manager'],
      location: json['location'],
      joinedTS: json['joinedTS'],
      phoneNumber: json['phoneNumber'],
    );
  }
}
