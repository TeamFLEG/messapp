class Users {
  late String id;
  late String fullName;
  late String email;
  late int phoneNumber;
  late String address;
  late bool admin;
  late String messName;

  Users({
    this.id = "",
    required this.fullName,
    this.email = '',
    required this.phoneNumber,
    required this.address,
    this.admin = false,
    this.messName = '',
  });

  Map<String, dynamic> toJSON() => {
        'id': id,
        'messName': fullName,
        'phone': phoneNumber,
        'address': address,
      };

  static Users fromJSON(Map<String, dynamic> json) => Users(
      id: json['id'],
      fullName: json['messName'],
      phoneNumber: json['phone'],
      address: json['address']);
}
