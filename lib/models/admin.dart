class Admin {
  late String id;
  late String fullName;
  late String email;
  late int phoneNumber;
  late String address;
  late String messName;

  Admin({
    this.id = "",
    required this.fullName,
    this.email = '',
    required this.phoneNumber,
    required this.address,
    this.messName = '',
  });

  Map<String, dynamic> toJSON() => {
    'id': id,
    'messName': fullName,
    'phone': phoneNumber,
    'address': address,
  };

  static Admin fromJSON(Map<String, dynamic> json) => Admin(
      id: json['id'],
      fullName: json['messName'],
      phoneNumber: json['phone'],
      address: json['address']);
}
