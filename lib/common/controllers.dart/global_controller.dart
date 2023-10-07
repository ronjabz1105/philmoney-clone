import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:philmoney/common/models/receiver.dart';

class GlobalController extends GetxController {
  final receiverRF = FirebaseFirestore.instance.collection("receiver");

  late List<ReceiverModel> _allReceiversList = <ReceiverModel>[].obs;
  List<ReceiverModel> get allReceiversList => _allReceiversList;

  late final List<ReceiverModel> _allReceiversBanks = <ReceiverModel>[].obs;
  List<ReceiverModel> get allReceiversBanks => _allReceiversBanks;

  late final List<ReceiverModel> _allReceiversPickUp = <ReceiverModel>[].obs;
  List<ReceiverModel> get allReceiversPickUp => _allReceiversPickUp;

  late final List<ReceiverModel> _allReceiversDoorToDoor =
      <ReceiverModel>[].obs;
  List<ReceiverModel> get allReceiversDoorToDoor => _allReceiversDoorToDoor;

  @override
  void onInit() {
    // TODO: implement onInit
    loadAllReceiver();
    print('global');
    super.onInit();
  }

  Future<void> loadAllReceiver() async {
    // print(' Loading from server ${allReceivers.length}');

    EasyLoading.show(
        indicator: const CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        dismissOnTap: true);

    try {
      QuerySnapshot<Map<String, dynamic>> data = await receiverRF.get();

      final receiverList =
          data.docs.map((json) => ReceiverModel.fromSnapshot(json)).toList();
      _allReceiversList = receiverList;
      //adding receiver by bank , pickup or door to door

      for (var element in receiverList) {
        //
        if (element.type == '1') {
          allReceiversBanks.add(element);
        } else if (element.type == '2') {
          allReceiversPickUp.add(element);
        } else if (element.type == '3') {
          allReceiversDoorToDoor.add(element);
        }
      }

      EasyLoading.dismiss();
      print(receiverList);
    } catch (e) {
      print('///////----error-----///////////');
      print(e);
    }
  }
}
