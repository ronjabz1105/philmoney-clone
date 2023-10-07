import 'package:cloud_firestore/cloud_firestore.dart';

class PickUpCentersModels {
  String pickUpCenter;
  String pickupIcon;

  PickUpCentersModels({
    required this.pickUpCenter,
    required this.pickupIcon,
  });

  PickUpCentersModels.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot)
      : pickUpCenter = snapshot['pickup_center'],
        pickupIcon = snapshot['iconPath'];

  PickUpCentersModels.fromJson(Map<String, dynamic> json)
      : pickUpCenter = json['pickup_center'],
        pickupIcon = json['iconPath'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pickup_center'] = pickUpCenter;

    data['iconPath'] = pickupIcon;

    return data;
  }
}
