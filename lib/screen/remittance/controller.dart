import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:philmoney/common/controllers.dart/global_controller.dart';
import 'package:philmoney/common/models/receiver.dart';
import 'package:philmoney/common/models/remittanceModel.dart';
import 'package:philmoney/common/routes/names.dart';
import 'package:philmoney/screen/remittance/index.dart';
import 'package:philmoney/screen/remittance/mode_of_payment/state.dart';

class RemittanceController extends GetxController {
  // final remittanceRF = FirebaseFirestore.instance.collection("remittance");
  final receiververRF = FirebaseFirestore.instance.collection("receiver");
  final paymentIconPathIndex = 0.obs;

  var getReceiver = false.obs;
  var hasDetails = false.obs;

  final rate = '1NTD = 1.784PHP';
  final remittanceCollection = 'remittance';

  final paymentIcon = "assets/images/711.png".obs;

  late List barCodes = [].obs;
  late RxString referrenceNumber = ''.obs;

  GlobalController globalController = Get.find<GlobalController>();

  List<ReceiverModel> get allReceivers => globalController.allReceiversList;

  // HistoryController historyController = Get.find<HistoryController>();

  final receiverInfo = Rxn<ReceiverModel>();
  final remittanceInfo = Rxn<RemittanceModel>();
  // final Map<String, dynamic> _remittance = <String, dynamic>{}.obs;
  var remittanceDetails = {}.obs;
  // get remittance => _remittance;

  late final receiverDocId = ''.obs;

  final ModeOfPaymentState paymentState = ModeOfPaymentState();
  final RemittanceState remittanceState = RemittanceState();

  late TextEditingController modOfPayment,
      receiverController,
      purposeController,
      currencyController,
      amountSendController,
      amountReceiveController,
      couponController,
      discountController,
      serviceFeeController,
      totalAmountController,
      errText;

  @override
  void onInit() {
    // TODO: implement onInit

    modOfPayment = TextEditingController();
    receiverController = TextEditingController();
    purposeController = TextEditingController();
    currencyController = TextEditingController();
    amountSendController = TextEditingController();
    amountReceiveController = TextEditingController();
    couponController = TextEditingController();
    discountController = TextEditingController();
    serviceFeeController = TextEditingController();
    totalAmountController = TextEditingController();

    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady

    print("remit");

    super.onReady();
  }

  @override
  void dispose() {
    modOfPayment.dispose();
    receiverController.dispose();
    purposeController.dispose();
    currencyController.dispose();

    amountSendController.dispose();
    amountReceiveController.dispose();
    couponController.dispose();
    discountController.dispose();

    serviceFeeController.dispose();
    totalAmountController.dispose();
    errText.dispose();

    // deadlinePayment.dispose();
    // referrenceNumber.dispose();
    // barcodes.dispose();

    super.dispose();
  }

  void goToModeOfPaymentPage() {
    // print("mode of payment page");
    Get.toNamed(AppRoutes.MODEOFPAYMENT);
  }

  void selectModeOfPayment(String paymentOption, iconIndex) {
    modOfPayment.text = paymentOption;
    //paymentIconPathIndex.value = iconIndex;
    paymentIcon.value = paymentState.modeOfPaymentListIcons[iconIndex];
    // print('${paymentIcon.value} path');
    Get.back();
  }

  void updateAmountSendAndReceive(String value, bool updateSendValue) {
    if (updateSendValue == true) {
      updateAmountSendValue(value);
    } else {
      updateAmountReceiveValue(value);
    }
  }

  void updateAmountReceiveValue(String value) {
    //print('value is $value ');
    if (value == '' || value.isEmpty || value == '0') {
      amountReceiveController.text = '';
    } else {
      var newValue = double.parse(value);
      var total = newValue * 1.784;
      amountReceiveController.text = total.toStringAsFixed(2);
    }
    calculateTotalAmount();
  }

  void updateAmountSendValue(value) {
    if (value == '' || value.isEmpty) {
      amountSendController.text = '';
    } else {
      var newValue = double.parse(value);
      var total = newValue / 1.784;

      amountSendController.text = total.toStringAsFixed(2);
    }

    calculateTotalAmount();
  }

  calculateTheServiceFee() {
    //getTheReciverForThisRemittance(receiverDocId.value);
    if (receiverInfo.value!.type == '1') {
      serviceFeeController.text = '100';
    } else {
      serviceFeeController.text = '150';
    }
  }

  void calculateTotalAmount() {
    calculateTheServiceFee();

    if (amountSendController.text == '' || amountSendController.text.isEmpty) {
      amountSendController.text = '0';
    }
    var amountSend = double.parse(amountSendController.text) +
        double.parse(serviceFeeController.text);
    totalAmountController.text = amountSend.toString();
  }

  void getTheReciverForThisRemittance(docId) {
    Get.back();
    getReceiver.value = !getReceiver.value;

    for (var element in allReceivers) {
      if (element.id == docId) {
        hasDetails.value = true;
        receiverInfo.value = element;
        calculateTheServiceFee();
        break;
      }
    }

    receiverController.text =
        '${receiverInfo.value!.fname} ${receiverInfo.value!.mname} ${receiverInfo.value!.lname}'
            .toUpperCase();
    receiverDocId.value = receiverInfo.value!.id!;
  }

  void goToReceiversList() {
    getReceiver.value = !getReceiver.value;
    Get.toNamed(AppRoutes.RECEIVER);
  }

  getTheDateOfRemittance() {
    List<String> computedDate = [];
    DateTime now = DateTime.now();

    getTheBarcodes(paymentState.modeOfPaymentsMap[modOfPayment.text], now);

    DateTime today = DateTime(
        now.year, now.month, now.day, now.hour, now.minute, now.second);
    var StringDate = today.toString();
    String remittanceDate =
        StringDate.replaceRange(StringDate.indexOf("."), StringDate.length, "");

    computedDate.add(remittanceDate);
    final haftHourFromNow = today.add(const Duration(minutes: 30)).toString();
    final finalOneHourFromNow = haftHourFromNow.replaceRange(
        haftHourFromNow.indexOf("."), haftHourFromNow.length, "");
    computedDate.add(finalOneHourFromNow);
    return computedDate;
  }

  getRandomCharacter(int numberOfChar) {
    final random2 = Random();
    const availableChars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final randomString = List.generate(numberOfChar,
            (index) => availableChars[random2.nextInt(availableChars.length)])
        .join();

    return randomString;
  }

  getReferrenceNumber(String date) {
    const availableChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final randomString = List.generate(5,
            (index) => availableChars[Random().nextInt(availableChars.length)])
        .join();
    //var getString = getRandomCharacter(5).toString().toUpperCase();

    referrenceNumber.value = 'EPH$date$randomString';
  }

  getTheBarcodes(index, DateTime dateNow) {
    // DateTime dateNow = DateTime.now();
    // print('index $index ${dateNow.month}');
    List varBarcodes = [];
    var hour = '${dateNow.hour}';
    var month = '${dateNow.month}';
    if (dateNow.month < 10) {
      month = '0$month';
    }

    var lunarYear = 12; // at this moment this is static.
    var fiveZero = '00000';
    var barcode1 =
        "$lunarYear$month${dateNow.day}${paymentState.modeOfPaymentCodeList[index]}";

    var barcode2 = "";
    var barcode3 = "";

    if (index == 0) {
      print('in zero $index');
      barcode2 = "029984010";
      var bar2 = '';
      for (var i = 0; i < 6; i++) {
        bar2 += Random().nextInt(10).toString();
      }
      barcode2 += bar2;

      var randomChar = getRandomCharacter(2);
      barcode3 +=
          "$month${dateNow.day}$randomChar$fiveZero${totalAmountController.text}";
    } else if (index == 1) {
      //means family mart
      barcode2 = "00";
      var bar2 = '';
      for (var i = 0; i < 3; i++) {
        bar2 += (Random().nextInt(8) + 1).toString();
      }
      bar2 += '0C';
      for (var i = 0; i < 4; i++) {
        bar2 += Random().nextInt(10).toString();
      }
      bar2 += 'C';
      for (var i = 0; i < 4; i++) {
        bar2 += Random().nextInt(10).toString();
      }
      barcode2 += bar2;

      var randomChar = getRandomCharacter(2);
      var mins = 0;
      final haftHourFromNow = dateNow.add(const Duration(minutes: 30));
      if (haftHourFromNow.minute >= 10 || haftHourFromNow.minute < 20) {
        mins = haftHourFromNow.minute - 10;
      } else if (haftHourFromNow.minute < 10) {
        mins = haftHourFromNow.minute + 20;
      } else {
        mins = haftHourFromNow.minute - 20;
      }

      if (dateNow.hour < 10) {
        hour = '0$hour';
      }
      barcode3 += "$hour$mins$randomChar$fiveZero${totalAmountController.text}";
    }
    String newBarcode3 =
        barcode3.replaceRange(barcode3.indexOf("."), barcode3.length, "");

    getReferrenceNumber('${dateNow.day}$month$hour');
    varBarcodes.add(barcode1);
    varBarcodes.add(barcode2);
    varBarcodes.add(newBarcode3);

    barCodes.assignAll(varBarcodes);
  }

  Future addNewRemittance() async {
    List<String> remittanceDateAndDeadline = getTheDateOfRemittance();

    var remittance = getRemittanceDetails();

    remittanceInfo.value = RemittanceModel.fromJson(remittance);

    // print(remittance);

    Get.toNamed(AppRoutes.REMITTANCE,
        arguments: true, preventDuplicates: false);
  }

  Future<void> confirmAddNewRemittance() async {
    var remit = getRemittanceDetails();
    try {
      //  String remittanceDocId = 'kkWFIqOx1xENcDoLAUbM';
      // var remittanceDocId =
      await receiververRF
          .doc(receiverDocId.value)
          .collection(remittanceCollection)
          .add(remit)
          .then((doc) => doc.id);

      Get.toNamed(AppRoutes.NEWREMITTANCEDETAILS);

      //Get.toNamed(AppRoutes.REMITTANCE, arguments: 2, preventDuplicates: false);
      // Get.offAllNamed(
      //   AppRoutes.REMITTANCEDETAILS,
      //   arguments: remit,
      // parameters: {
      //   'remittanceId': remittanceDocId,
      //   'receiverId': receiverDocId.value,
      //   'isBack': 'false',
      // }
      // );

      // print(remit);

    } catch (e) {
      if (kDebugMode) {
        print("/////erroorrrr////// \n $e");
      }
    }
  }

  getRemittanceDetails() {
    List<String> remittanceDateAndDeadline = getTheDateOfRemittance();

    var remittance = {
      'referrence_number': referrenceNumber.value,
      "mode_of_payment": {
        "store_name": modOfPayment.text,
        "icon_path": paymentIcon.value,
        "barcode1": barCodes[0],
        "barcode2": barCodes[1],
        "barcode3": barCodes[2],
      },
      "rate": rate,
      "payment_deadline": remittanceDateAndDeadline[1],
      "receiver_id": receiverDocId.value,
      "purpose": purposeController.text,
      "amount_send": amountSendController.text,
      "amount_receive": amountReceiveController.text,
      "discount": discountController.text,
      "service_fee": serviceFeeController.text,
      "total_amount": totalAmountController.text,
      "date": remittanceDateAndDeadline[0],
      "createdAt": Timestamp.now(),
      "status": "unpaid",
      "txn_status": 0, // 0=unpaid 1= paid 2=intransit 3=processed
    };
    return remittance;
  }

  ///////////////////end//////////////////
}
