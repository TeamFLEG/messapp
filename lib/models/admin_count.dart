class AdminCount {
  late String messID;
  late int users;

  AdminCount({
    required this.messID,
    this.users = 0,
  });

  Map<String, dynamic> toJSON() => {'messID': messID, "users": users};

  static AdminCount fromJSON(Map<String, dynamic> json) => AdminCount(
        messID: json['messID'],
        users: json['users'],
      );
}
