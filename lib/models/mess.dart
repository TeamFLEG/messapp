class Mess {
  late int messCode;
  late String messName;
  late String manager;
  late String location;
  late DateTime? joiningDT;

  Mess({
    required this.messCode,
    required this.messName,
    required this.manager,
    required this.location,
    required this.joiningDT,
  });

  Map<String, dynamic> toJSON() => {
        'messID': messCode,
        'messName': messName,
        'owner': manager,
        'location': location,
        'joiningDT': joiningDT,
      };

  static Mess fromJSON(Map<String, dynamic> json) {
    return Mess(
      messCode: json['messCode'],
      messName: json['messName'],
      manager: json['manager'],
      location: json['location'],
      joiningDT: json['joiningDT'],
    );
  }
}
