import 'package:cloud_firestore/cloud_firestore.dart';

class Transactions {
  late String messID;
  late double amount;
  late String fullName;
  late Timestamp transactionTS;
  late String paymentDate;

  Transactions({
    required this.messID,
    required this.amount,
    required this.fullName,
    required this.transactionTS,
    this.paymentDate = '',
  });

  Map<String, dynamic> toJSON() => {
        'messID': messID,
        "amount": amount,
        "fullName": fullName,
        "transactionTS": transactionTS,
        "paymentDate": paymentDate,
      };

  static Transactions fromJSON(Map<String, dynamic> json) => Transactions(
        messID: json['messID'],
        amount: json['amount'],
        fullName: json['fullName'],
        transactionTS: json['transactionTS'],
        paymentDate: json['paymentDate'],
      );
}
