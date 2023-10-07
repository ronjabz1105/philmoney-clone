import 'package:cloud_firestore/cloud_firestore.dart';

class DoorToDoorModel {
  String address;

  int zipcode;

  DoorToDoorModel({
    required this.address,
    required this.zipcode,
  });

  DoorToDoorModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : address = snapshot['address'],
        zipcode = snapshot['zipcode'];

  DoorToDoorModel.fromJson(Map<String, dynamic> json)
      : address = json['address'] as String,
        zipcode = json['zipcode'] as int;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;

    data['zipcode'] = zipcode;

    return data;
  }
}
