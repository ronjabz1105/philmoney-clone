import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:philmoney/common/routes/names.dart';
import 'package:philmoney/common/Theme/colors.dart';
import 'package:philmoney/screen/remittance/controller.dart';

class TextFieldDecoration extends GetView<RemittanceController> {
  TextEditingController textController;
  String hintText;
  String titleText;
  bool readOnly;
  bool selectPurpose;
  Color borderColor;
  bool txtAlignCenter;
  bool isNumber;
  String prefix;
  bool updateSendValue;
  bool coupon;
  VoidCallback? onTap;
  //bool hasPrefix;

  TextFieldDecoration({
    Key? key,
    required this.textController,
    required this.hintText,
    required this.titleText,
    this.readOnly = false,
    this.borderColor = AppColors.borderText,
    this.selectPurpose = false,
    this.txtAlignCenter = true,
    this.isNumber = true,
    this.prefix = 'NTD',
    this.onTap,
    this.coupon = false,

    /// false = updateAmountReceiveValue
    /// true = updateAmountSendValue
    this.updateSendValue = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: 100,
              child: Text(
                titleText,
                textAlign: TextAlign.end,
              )),
          SizedBox(
            height: 40,
            width: 250,
            child: TextFormField(
              onTap: (() {
                if (selectPurpose) {
                  _selectPurpose();
                } else if (coupon) {
                  Get.toNamed(AppRoutes.COUPON);
                }
              }),

              // onTap,
              //selectPurpose   ? (() => _selectPurpose()) : (() {}),
              //Get.toNamed(AppRoutes.COUPON)
              onFieldSubmitted: (value) {
                controller.updateAmountSendAndReceive(value, updateSendValue);
              },
              // onChanged: (value) {
              //   controller.updateAmountSendAndReceive(value, updateSendValue);
              // },
              controller: textController,
              readOnly: readOnly,
              keyboardType:
                  isNumber ? TextInputType.number : TextInputType.text,
              textAlign: txtAlignCenter ? TextAlign.center : TextAlign.end,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                    borderRadius: BorderRadius.circular(5)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                    borderRadius: BorderRadius.circular(5)),
                hintText: hintText,
                fillColor: AppColors.thirdElementText,
                isDense: true,

                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    prefix,
                    style: const TextStyle(color: AppColors.thirdElementText),
                  ),
                ),
                // prefixIconConstraints:
                //     const BoxConstraints(minWidth: 0, minHeight: 0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BuildText extends GetView<RemittanceController> {
  String text;
  BuildText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          controller.purposeController.text = text;
          Get.back();
          //print(' purpose is ${controller.purposeController.text}');
        },
        child: Column(children: [
          Text(
            text,
            style: const TextStyle(
                fontFamily: 'Aviner',
                fontSize: 20,
                fontWeight: FontWeight.normal),
          ),
          _buildDivider(),
        ]),
      ),
    );
  }
}

Widget _buildDivider() {
  return const Divider(
    thickness: 1,
    color: AppColors.thirdElementText,
  );
}

Future<dynamic> _selectPurpose() {
  return Get.defaultDialog(
    title: "Purpose of Remittance",
    content: Container(
      padding: const EdgeInsets.only(top: 15),
      height: Get.height * 0.6,
      width: Get.width * 0.8,
      child: SingleChildScrollView(
        child: Column(
          children: [
            BuildText(text: "Bills"),
            BuildText(text: "Education"),
            BuildText(text: "Home Improvement"),
            BuildText(text: "Payment of Goods"),
            BuildText(text: "Savings"),
            BuildText(text: "Family Support"),
            BuildText(text: "Others"),
          ],
        ),
      ),
    ),
    textCancel: "Cancel",
    buttonColor: Colors.transparent,
  );
}
