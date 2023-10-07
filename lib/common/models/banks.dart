import 'package:cloud_firestore/cloud_firestore.dart';

class BanksModel {
  String bankName;
  String accountNumber;
  String bankIcon;

  BanksModel({
    required this.bankName,
    required this.accountNumber,
    required this.bankIcon,
  });

  BanksModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : bankName = snapshot['bank_name'],
        accountNumber = snapshot['account_number'],
        bankIcon = snapshot['iconPath'];

  BanksModel.fromJson(Map<String, dynamic> json)
      : bankName = json['bank_name'],
        accountNumber = json['account_number'],
        bankIcon = json['iconPath'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bank_name'] = bankName;
    data['account_number'] = accountNumber;
    data['iconPath'] = bankIcon;

    return data;
  }
}
