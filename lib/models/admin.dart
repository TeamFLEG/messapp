class Admin {
  late String id;
  late String messName;
  late String managerName;
  late int phoneNumber;
  late String address;

  Admin({
    this.id = "",
    required this.messName,
    required this.managerName,
    required this.phoneNumber,
    required this.address
  });

  Map<String, dynamic> toJSON() => {
    'id': id,
    'messName': messName,
    'managerName': managerName,
    'phone': phoneNumber,
    'address': address
  };

  static Admin fromJSON(Map<String, dynamic> json) => Admin(
    id: json['id'],
    messName: json['messName'],
    managerName: json['managerName'],
    phoneNumber: json['phone'],
    address: json['address']
  );
}