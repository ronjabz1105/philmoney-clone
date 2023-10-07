import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:philmoney/common/models/receiver.dart';
import 'package:philmoney/common/models/remittanceModel.dart';
import 'package:philmoney/common/routes/names.dart';
import 'package:philmoney/screen/history/index.dart';

class HistoryController extends GetxController {
  final remittanceRF = FirebaseFirestore.instance.collection("remittance");
  final receiverRF = FirebaseFirestore.instance.collection("receiver");

  // GlobalController globalController = Get.find<GlobalController>();

  late final List<RemittanceModel> _allRemittance = <RemittanceModel>[].obs;
  List<RemittanceModel> get allRemittance => _allRemittance;

  late List<ReceiverModel> _allReceiver = <ReceiverModel>[].obs;
  List<ReceiverModel> get allReceiver => _allReceiver;

  late List<RemittanceModel> allPaidRemittance = <RemittanceModel>[].obs;
  late List<RemittanceModel> allUnpaidRemittance = <RemittanceModel>[].obs;
  late List<RemittanceModel> allExpiredRemittance = <RemittanceModel>[].obs;
  late List<ReceiverModel> allReceiverPaidRemittance = <ReceiverModel>[].obs;
  late List<ReceiverModel> allReceiverUnpaidRemittance = <ReceiverModel>[].obs;
  late List<ReceiverModel> allReceiverExpiredRemittance = <ReceiverModel>[].obs;

  var isLoading = true.obs;
  var paidRemittance = 0.obs;
  var unpaidRemittance = 0.obs;
  var historyState = HistoryState();

  @override
  void onReady() {
    // TODO: implement onReady

    //print('on ready history ${paidRemittance.value}');
    Future.delayed(
      const Duration(seconds: 5),
      () => isLoading.value = false,
    );
    // isLoading.value = true;
    super.onReady();
  }

  @override
  void onInit() {
    // TODO: implement onInit

    print('history');

    // loadAllRemittance();
    loadAllReceiver();

    super.onInit();
  }

  Future<void> loadAllReceiver() async {
    print('history Getting all receiver');
    // EasyLoading.show(
    //     indicator: const CircularProgressIndicator(),
    //     maskType: EasyLoadingMaskType.clear,
    //     dismissOnTap: true);

    try {
      QuerySnapshot<Map<String, dynamic>> data = await receiverRF.get();

      final receiverList =
          data.docs.map((json) => ReceiverModel.fromSnapshot(json)).toList();
      _allReceiver = receiverList;

      //# Getting all the remittance for every receiver
      for (var element in receiverList) {
        QuerySnapshot<Map<String, dynamic>> remittanceDetails =
            await receiverRF.doc(element.id).collection('remittance').get();

        //# list of remittance
        final remittanceInfo = remittanceDetails.docs
            .map((snapshot) => RemittanceModel.fromSnapshot(snapshot))
            .toList();
        element.remittances = remittanceInfo;
      }

      for (var element in receiverList) {
        for (var i = 0; i < element.remittances!.length; i++) {
          _allRemittance.add(element.remittances![i]);
          if (element.remittances![i].status == 'paid') {
            allPaidRemittance.add(element.remittances![i]);
            allReceiverPaidRemittance.add(element);
            paidRemittance.value = allPaidRemittance.length;
          } else if (element.remittances![i].status == 'unpaid') {
            allUnpaidRemittance.add(element.remittances![i]);
            allReceiverUnpaidRemittance.add(element);
            unpaidRemittance.value = allUnpaidRemittance.length;
          } else if (element.remittances![i].status == 'expired') {
            allExpiredRemittance.add(element.remittances![i]);
            allReceiverExpiredRemittance.add(element);
            // paidRemittance.value = allExpiredRemittance.length;
          }
          //print(' for ${element.fname} id is  ${element.remittances![i].id}');
        }
      }

      // EasyLoading.dismiss();
    } catch (e) {
      if (kDebugMode) {
        print('///////----error in receiver-----///////////   \n$e ');
      }
    }
  }

  getReceiverInfoFromThisDocId(docId) {
    for (var element in allReceiver) {
      if (element.id == docId) {
        //print('element ${element.fname}');
        return element;
      }
    }
  }

  getRemittanceInfoFromThisDocId(docId) {
    print(' docId $docId');

    for (var element in allRemittance) {
      if (element.id == docId) {
        //print('element $element');
        return element;
      }
    }
  }

  goToRemittanceDetails() {
    Get.toNamed(
      AppRoutes.REMITTANCEDETAILS,
    );
  }

  ///////////////===========END===========/////////////
}


































  // Future<void> loadAllRemittance() async {
  //   // EasyLoading.show(
  //   //     indicator: const CircularProgressIndicator(),
  //   //     maskType: EasyLoadingMaskType.clear,
  //   //     dismissOnTap: true);

  //   // print('on gettting data from remittance ');
  //   try {
  //     QuerySnapshot<Map<String, dynamic>> data =
  //         await remittanceRF.orderBy('createdAt', descending: false).get();
  //     print(data);
  //     final remitanceList =
  //         data.docs.map((json) => RemittanceModel.fromSnapshot(json)).toList();
  //     _allRemittance = remitanceList;

  //     for (var element in remitanceList) {
  //       //
  //       if (element.status == 'paid') {
  //         allPaidRemittance.add(element);
  //       } else if (element.status == 'unpaid') {
  //         allUnpaidRemittance.add(element);
  //       } else if (element.status == 'expired') {
  //         allExpiredRemittance.add(element);
  //       }
  //     }
  //     paidRemittance.value = allPaidRemittance.length;
  //     //adding receiver by bank , pickup or door to door

  //     //EasyLoading.dismiss();

  //     // print(' data ${remitanceList.length}');
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('///////----error-----///////////   \n$e ');
  //     }
  //   }
  // }