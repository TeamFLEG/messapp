import 'package:messapp/widgets/mess_card.dart';

class Mess {
  // late int messID;
  late String messName;
  // late String owner;
  late String location;
  // late DateTime? joiningDT;

  Mess({
    // required this.messID,
    required this.messName,
    // required this.owner,
    required this.location,
    // required this.joiningDT,
  });

  Map<String, dynamic> toJSON() => {
        // 'messID': messID,
        'messName': messName,
        // 'owner': owner,
        'location': location,
        // 'joiningDT': joiningDT,
      };

  static Mess fromJSON(Map<String, dynamic> json) {
    return Mess(
      // messID: json['messID'],
      messName: json['messName'],
      // owner: json['owner'],
      location: json['location'],
      // joiningDT: json['joiningDT'],
    );
  }
}
