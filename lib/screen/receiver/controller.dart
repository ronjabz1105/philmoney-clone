import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:philmoney/common/models/receiver.dart';
import 'package:philmoney/common/routes/names.dart';
import 'package:philmoney/screen/receiver/crud_receiver/update_receiver.dart';
import 'package:philmoney/screen/remittance/controller.dart';

import 'index.dart';

class ReceiverController extends GetxController {
  RemittanceController remittanceController = Get.find<RemittanceController>();

  final receiverRF = FirebaseFirestore.instance.collection("receiver");

  late List<ReceiverModel> _allReceivers = <ReceiverModel>[].obs;
  late final List<ReceiverModel> allReceiversBanks = <ReceiverModel>[].obs;
  late final List<ReceiverModel> allReceiversPickUp = <ReceiverModel>[].obs;
  late final List<ReceiverModel> allReceiversDoorToDoor = <ReceiverModel>[].obs;

  get allReceivers => _allReceivers;
  //get allReceiversBanks => _allReceiversBanks;
  // get allReceiversPickUp => _allReceiversPickUp;
  // get allReceiversDoorToDoor => _allReceiversDoorToDoor;

  // final dbReceiver = DBReceiver().receiversData;
  // use to check what the user choose
  // 1= Bank to Bank
  // 2= Pick up
  // 3= Door to Door
  var receiversOption = ''.obs;

  // refers to bank icon as suffix of the textinput field
  var bankSuffixIconPath = ''.obs;

  // use this to toggle between bank and bayad center
  var bankHintText = 'Bank Name'.obs;

  final state = ReceiverState();

  late TextEditingController docId,
      relationship,
      firstName,
      middleName,
      lastName,
      contactNumber,
      pickUpCenter,
      pickUpCenterOrBank,
      bankName,
      accountNumber,
      cityProvince,
      completeAddress,
      zipCode,
      iconPath,
      note;

  @override
  void onReady() {
    // TODO: implement onReady
    //loadReceiver();
    docId = TextEditingController();
    relationship = TextEditingController();
    firstName = TextEditingController();
    middleName = TextEditingController();
    lastName = TextEditingController();
    contactNumber = TextEditingController();
    pickUpCenter = TextEditingController();
    bankName = TextEditingController();
    accountNumber = TextEditingController();
    cityProvince = TextEditingController();
    note = TextEditingController();
    pickUpCenterOrBank = TextEditingController();
    completeAddress = TextEditingController();
    iconPath = TextEditingController();
    zipCode = TextEditingController();
    super.onReady();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    loadReceiver();

    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    docId.dispose();
    relationship.dispose();
    firstName.dispose();
    middleName.dispose();
    lastName.dispose();
    contactNumber.dispose();
    pickUpCenter.dispose();
    cityProvince.dispose();
    bankName.dispose();
    accountNumber.dispose();
    note.dispose();
    pickUpCenterOrBank.dispose();
    completeAddress.dispose();
    zipCode.dispose();
    iconPath.dispose();
    super.dispose();
  }

  clearTextControllerData() {
    docId.text = '';
    relationship.text = '';
    firstName.text = '';
    middleName.text = '';
    lastName.text = '';
    contactNumber.text = '';
    pickUpCenter.text = '';
    cityProvince.text = '';
    bankName.text = '';
    accountNumber.text = '';
    note.text = '';
    pickUpCenterOrBank.text = '';
    completeAddress.text = '';
    zipCode.text = '0';
    iconPath.text = '';
  }

  void loadReceiver() async {
    // print(' Loading from server ${allReceivers.length}');

    EasyLoading.show(
        indicator: const CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        dismissOnTap: true);

    try {
      QuerySnapshot<Map<String, dynamic>> data = await receiverRF.get();

      final receiverList =
          data.docs.map((json) => ReceiverModel.fromSnapshot(json)).toList();
      _allReceivers = receiverList;
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

      // print(' data ${allReceiversBanks.length}');
    } catch (e) {
      print('///////----error-----///////////');
      print(e);
    }
  }

  void updateRelationshipController(String value) {
    relationship.text = value;
    Get.back();

    //print("function call ${relationship.text}");
  }

  void updateBankNameController(index) {
    if (receiversOption.value == '1') {
      bankSuffixIconPath.value = state.bankIconsPath[index];
      bankName.text = state.banksNameShortCut[index];
      iconPath.text = state.bankIconsPath[index];
    } else if (receiversOption.value == '2') {
      bankSuffixIconPath.value = state.pickupCenterIconsPath[index];
      pickUpCenter.text = state.pickUpCenters[index];
      iconPath.text = state.pickupCenterIconsPath[index];
    }

    Get.back();
  }

  void goToAddNewReceiver(String receiverOption) {
    receiversOption.value = receiverOption;

    bankSuffixIconPath.value = '';

    if (receiversOption.value == '1') {
      bankName.text = '';
      bankHintText.value = "Bank Name";
    } else if (receiversOption.value == '2') {
      bankHintText.value = "Pick-up Center";
      pickUpCenter.text = '';
    }
    Get.toNamed(AppRoutes.ADDRECEIVER);
    // print("receiversOption is ${receiversOption.value}");
  }

  Future<void> addNewReceiver() async {
    var newReceiver = {
      "type": receiversOption.value,
      "relationship": relationship.text,
      "first_name": firstName.text,
      "middle_name": middleName.text,
      "last_name": lastName.text,
      "contact_number": contactNumber.text,
      "city_province": cityProvince.text,
      "banks": getbankPickupOrDoortoDoorDetails(1),
      "pickup": getbankPickupOrDoortoDoorDetails(2),
      "doortodoor": getbankPickupOrDoortoDoorDetails(3),
      "note": note.text,
    };

    try {
      //allReceivers.add(ReceiverModel.fromJson(newReceiver));
      String? addedDocId;
      await receiverRF
          .add(newReceiver)
          .then((DocumentReference doc) => addedDocId = doc.id);
      print('new added id $addedDocId');
      if (receiversOption.value == '1') {
        allReceiversBanks.add(ReceiverModel.fromJson(newReceiver));
        allReceiversBanks[allReceiversBanks.length - 1].id = addedDocId;
      } else if (receiversOption.value == '2') {
        allReceiversPickUp.add(ReceiverModel.fromJson(newReceiver));
        allReceiversPickUp[allReceiversPickUp.length - 1].id = addedDocId;
      } else if (receiversOption.value == '3') {
        allReceiversDoorToDoor.add(ReceiverModel.fromJson(newReceiver));
        allReceiversDoorToDoor[allReceiversDoorToDoor.length - 1].id =
            addedDocId;
      }
    } catch (e) {
      if (kDebugMode) {
        print("error.....");
        print(e.toString());
      }
    }
    clearTextControllerData();
    Get.back();
  }

  void goToUpdateReceiver(ReceiverModel receiver) {
    print(receiver);
    receiversOption.value = receiver.type;

    docId.text = receiver.id!;

    relationship.text = receiver.relationship;
    firstName.text = receiver.fname;
    middleName.text = receiver.mname;
    lastName.text = receiver.lname;
    contactNumber.text = receiver.contactNumber;

    cityProvince.text = receiver.cityProvince;
    note.text = receiver.note!;

    // for banks
    if (receiver.type == "1") {
      accountNumber.text = receiver.banks!.accountNumber;
      bankName.text = receiver.banks!.bankName;
      bankSuffixIconPath.value = receiver.banks!.bankIcon;
      iconPath.text = receiver.banks!.bankIcon;
    } else if (receiver.type == "2") {
      pickUpCenter.text = receiver.pickup!.pickUpCenter;
      bankSuffixIconPath.value = receiver.pickup!.pickupIcon;
      iconPath.text = receiver.pickup!.pickupIcon;

      print('found ${pickUpCenter.text}   ${iconPath.text}   ');
    }

    Get.toNamed(AppRoutes.UPDATERECEIVER);
    //print('here ${receiversOption.value}');
  }

  Future<void> upgdateReceiver() async {
    var optionType = int.parse(receiversOption.value);
    var receiverInfo = {
      "relationship": relationship.text,
      "first_name": firstName.text,
      "middle_name": middleName.text,
      "last_name": lastName.text,
      "contact_number": contactNumber.text,
      "city_province": cityProvince.text,
      "${state.receiverOptions[optionType]}":
          getbankPickupOrDoortoDoorDetails(optionType),
      "note": note.text,
    };

    if (optionType == 1) {
      updateThisReceiversList(allReceiversBanks);
      update(['bank_receiver']);
    } else if (optionType == 2) {
      updateThisReceiversList(allReceiversPickUp);
      update(['pickup_receiver']);
    } else if (optionType == 3) {
      updateThisReceiversList(allReceiversDoorToDoor);
      update(['doortodoor_receiver']);
    }

    try {
      //print(receiverInfo);
      await receiverRF.doc(docId.text).update(receiverInfo);
    } catch (e) {
      print("/////erroorrrr//////");
      print(e);
    }
    clearTextControllerData();
    Get.back();
  }

  updateThisReceiversList(receiverList) {
    List<ReceiverModel> receiverDetails = receiverList;

    for (var i = 0; i < receiverDetails.length; i++) {
      if (receiverDetails[i].id == docId.text) {
        receiverDetails[i].relationship = relationship.text;
        receiverDetails[i].fname = firstName.text;
        receiverDetails[i].mname = middleName.text;
        receiverDetails[i].lname = lastName.text;
        receiverDetails[i].contactNumber = contactNumber.text;
        receiverDetails[i].cityProvince = cityProvince.text;
        receiverDetails[i].note = note.text;

        if (receiverDetails[i].type == '1') {
          receiverDetails[i].banks!.bankName = bankName.text;
          receiverDetails[i].banks!.accountNumber = accountNumber.text;
          receiverDetails[i].banks!.bankIcon = iconPath.text;
        } else if (receiverDetails[i].type == '2') {
          receiverDetails[i].pickup!.pickUpCenter = pickUpCenter.text;
          receiverDetails[i].pickup!.pickupIcon = iconPath.text;
        } else if (receiverDetails[i].type == '3') {
          if (zipCode.text.isEmpty) {
            zipCode.text = '0';
          }
          receiverDetails[i].doorToDoor!.address = completeAddress.text;
          receiverDetails[i].doorToDoor!.zipcode = int.parse(zipCode.text);
        }

        break;
      }
    }
  }

  getbankPickupOrDoortoDoorDetails(option) {
    var bankData = {
      "bank_name": "",
      "account_number": "",
      "iconPath": "",
    };
    var pickuPData = {
      "pickup_center": "",
      "iconPath": "",
    };
    var doorToDoorPData = {
      "address": "",
      "zipcode": 0,
    };

    if (option == 1) {
      bankData = {
        "bank_name": bankName.text,
        "account_number": accountNumber.text,
        "iconPath": iconPath.text,
      };
      return bankData;
    } else if (option == 2) {
      pickuPData = {
        "pickup_center": pickUpCenter.text,
        "iconPath": iconPath.text,
      };
      return pickuPData;
    } else if (option == 3) {
      if (zipCode.text.isEmpty) {
        zipCode.text = '0';
      }
      doorToDoorPData = {
        "address": completeAddress.text,
        "zipcode": int.parse(zipCode.text),
      };
      return doorToDoorPData;
    }
  }

  deleteThisReceiver() {
    try {
      receiverRF.doc(docId.text).delete();
    } catch (e) {
      print("/////erroorrrr//////");
      print(e);
    }

    if (receiversOption.value == '1') {
      allReceiversBanks.removeWhere(
        (element) => element.id == docId.text,
      );
      update(['bank_receiver']);
    } else if (receiversOption.value == '2') {
      allReceiversPickUp.removeWhere(
        (element) => element.id == docId.text,
      );
      update(['pickup_receiver']);
    } else if (receiversOption.value == '3') {
      allReceiversDoorToDoor.removeWhere(
        (element) => element.id == docId.text,
      );
      update(['doortodoor_receiver']);
    }

    Get.back();
    successfullDeletedConfirmation();
    clearTextControllerData();
  }

///////////////////%%%%% E N D %%%%%%///////////////////////
}
