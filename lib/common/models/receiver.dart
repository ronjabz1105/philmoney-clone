import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:philmoney/common/models/banks.dart';
import 'package:philmoney/common/models/door_to_door.dart';
import 'package:philmoney/common/models/pickup_center.dart';
import 'package:philmoney/common/models/remittanceModel.dart';

class ReceiverModel {
  String? id;
  String type;
  String relationship;
  String fname;
  String mname;
  String lname;
  String contactNumber;

  String cityProvince;
  String? note;

  BanksModel? banks;
  PickUpCentersModels? pickup;
  DoorToDoorModel? doorToDoor;
  List<RemittanceModel>? remittances;

  ReceiverModel(
      {this.id,
      required this.type,
      required this.relationship,
      required this.fname,
      required this.mname,
      required this.lname,
      required this.contactNumber,
      required this.cityProvince,
      this.note,
      this.banks,
      this.pickup,
      this.doorToDoor,
      remittances});

  ReceiverModel.fromJson(Map<String, dynamic> json)
      : //id = json.id,
        type = json['type'],
        relationship = json['relationship'],
        fname = json['first_name'],
        lname = json['last_name'],
        mname = json['middle_name'],
        contactNumber = json['contact_number'],
        cityProvince = json['city_province'],
        note = json['note'],
        banks = BanksModel.fromJson(json['banks']),
        pickup = PickUpCentersModels.fromJson(json['pickup']),
        doorToDoor = DoorToDoorModel.fromJson(json['doortodoor']),
        remittances = (json['remittance'] as List)
            .map((dynamic e) =>
                RemittanceModel.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['id'] = id;
    data['type'] = type;
    data['relationship'] = relationship;
    data['first_name'] = fname;
    data['middle_name'] = mname;
    data['last_name'] = lname;
    data['contact_number'] = contactNumber;
    data['city_province'] = cityProvince;
    data['note'] = note;
    data['banks'] = banks;
    data['pickup'] = pickup;
    data['doortodoor'] = doorToDoor;
    // data['remittance'] = remittances;

    return data;
  }

  ReceiverModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        type = snapshot['type'],
        relationship = snapshot['relationship'],
        fname = snapshot['first_name'],
        lname = snapshot['last_name'],
        mname = snapshot['middle_name'],
        contactNumber = snapshot['contact_number'],
        cityProvince = snapshot['city_province'],
        note = snapshot['note'],
        banks = BanksModel.fromJson(snapshot['banks']),
        pickup = PickUpCentersModels.fromJson(snapshot['pickup']),
        doorToDoor = DoorToDoorModel.fromJson(snapshot['doortodoor']),
        remittances = [];
  // (snapshot['remittance'] as List)
  //     .map((dynamic e) =>
  //         RemittanceModel.fromJson(e as Map<String, dynamic>))
  //     .toList();
}
