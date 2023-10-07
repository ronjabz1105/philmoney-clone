import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:philmoney/common/routes/names.dart';
import 'package:philmoney/common/Theme/colors.dart';
import 'package:philmoney/common/widget/background.dart';
import 'package:philmoney/common/widget/commonAppBar.dart';

import '../index.dart';

class UpdateReceiver extends StatelessWidget {
  // String?

  const UpdateReceiver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.thirdElementText,
      body: SafeArea(
        child: Stack(children: [
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: MainBackground(),
          ),
          Positioned(
            top: 5,
            left: 0,
            right: 0,
            child: CommonAppbar(
              title: "Update Receiver",
            ),
          ),
          const Positioned(
              top: 50, left: 0, right: 0, bottom: 0, child: BuildBody()),
          Positioned(right: 5, top: 5, child: _buildDeleteButton()),
        ]),
      ),
    );
  }
}

Future<dynamic> deleteConfirmation() {
  var controller = Get.find<ReceiverController>();
  return Get.defaultDialog(
    title: "Do you want to Delete",
    content: Text(
        '${controller.firstName.text} ${controller.middleName.text}  ${controller.lastName.text}?'),
    onConfirm: () {
      controller.deleteThisReceiver();
    },
    onCancel: () {},
    confirmTextColor: Colors.white,
    textConfirm: 'Delete',
  );
}

Future<dynamic> successfullDeletedConfirmation() {
  var controller = Get.find<ReceiverController>();
  return Get.defaultDialog(
    title: "Deleted Successfully",
    content: Text(
        '${controller.firstName.text} ${controller.middleName.text}  ${controller.lastName.text}'),
    onCancel: () {
      Get.back();
    },
    textCancel: 'Confirm',
  );
}

Widget _buildDeleteButton() {
  return InkWell(
    onTap: () {
      deleteConfirmation();
    },
    child: const Image(
      height: 30,
      width: 30,
      color: Colors.white,
      image: AssetImage(
        ('assets/icons/delete.png'),
      ),
    ),
  );
}

Widget _buildNoteText(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 11,
      fontFamily: "Montserrat",
      color: AppColors.warningText,
    ),
  );
}

class BuildBody extends GetView<ReceiverController> {
  const BuildBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 35,
                  width: Get.width * 0.31,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    border: Border.all(
                      width: 1.5,
                      color: AppColors.thirdElementText,
                    ),
                    color: controller.receiversOption.value != '1'
                        ? AppColors.submitButtonBlue
                        : AppColors.thirdElementText,
                  ),
                  child: Center(
                    child: Text(
                      "Bank to bank",
                      style: TextStyle(
                        color: controller.receiversOption.value != '1'
                            ? AppColors.thirdElementText
                            : AppColors.submitButtonBlue,
                      ),
                    ),
                  )),
              Container(
                  height: 35,
                  // width: 120,
                  width: Get.width * 0.31,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.5,
                        color: AppColors.thirdElementText,
                      ),
                      color: controller.receiversOption.value != '2'
                          ? AppColors.submitButtonBlue
                          : AppColors.thirdElementText
                      //color: Colors.white
                      ),
                  child: Center(
                    child: Text(
                      "Pick up",
                      style: TextStyle(
                          color: controller.receiversOption.value != '2'
                              ? AppColors.thirdElementText
                              : AppColors.submitButtonBlue),
                    ),
                  )),
              Container(
                  height: 35,
                  width: Get.width * 0.31,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    border: Border.all(
                      width: 1.5,
                      color: AppColors.thirdElementText,
                    ),
                    color: controller.receiversOption.value != '3'
                        ? AppColors.submitButtonBlue
                        : AppColors.thirdElementText,
                    //color: Colors.white
                  ),
                  child: Center(
                    child: Text(
                      "Door to door",
                      style: TextStyle(
                          color: controller.receiversOption.value != '3'
                              ? AppColors.thirdElementText
                              : AppColors.submitButtonBlue),
                    ),
                  )),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            height: Get.height * 0.7,
            width: Get.width * 0.95,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: AppColors.primaryBackground,
                borderRadius: BorderRadius.circular(20)),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  _buildNoteText(
                      "*Pls. enter account information same with the passbook."),
                  ReceiverTextField(
                    ontap: () {
                      Get.toNamed(AppRoutes.RELATIONSHIPLIST);
                    },
                    readOnly: true,
                    textController: controller.relationship,
                    hintText: "Relationship",
                  ),
                  ReceiverTextField(
                      textController: controller.firstName,
                      hintText: "First Name"),
                  _buildNoteText(
                      "*Pls. enter complete name same with ID.(18 yrs. old below is not allowed)"),
                  ReceiverTextField(
                      textController: controller.middleName,
                      hintText: "Middle Name"),
                  ReceiverTextField(
                      textController: controller.lastName,
                      hintText: "Last Name"),
                  ReceiverTextField(
                      textController: controller.contactNumber,
                      isNumber: true,
                      hintText: "Contact Number"),
                  Obx(
                    () => controller.receiversOption.value == '3'
                        ? ReceiverTextField(
                            textController: controller.completeAddress,
                            hintText: "Complete Address ")
                        : ReceiverTextField(
                            ontap: () {
                              Get.toNamed(AppRoutes.BANKLIST);
                            },
                            suffixIcon: controller.bankSuffixIconPath.value,
                            readOnly: true,
                            textController:
                                controller.receiversOption.value == '1'
                                    ? controller.bankName
                                    : controller.pickUpCenter,
                            hintText: controller.bankHintText.value),
                  ),
                  Obx(
                    () => controller.receiversOption.value == '1'
                        ? ReceiverTextField(
                            textController: controller.accountNumber,
                            isNumber: true,
                            hintText: "Acc. No.")
                        : Container(),
                  ),
                  Obx(
                    () => controller.receiversOption.value == '3'
                        ? ReceiverTextField(
                            textController: controller.zipCode,
                            isNumber: true,
                            hintText: "Zip Code")
                        : ReceiverTextField(
                            textController: controller.cityProvince,
                            hintText: "City/Provice "),
                  ),
                  ReceiverTextField(
                      textController: controller.note,
                      hintText: "Note (not required) "),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (() => controller.upgdateReceiver()),
            child: Container(
              padding: const EdgeInsets.all(15),
              height: 50,
              width: Get.width * 0.9,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.submitButton,
              ),
              child: const Text(
                'Submit',
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryElementText,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
