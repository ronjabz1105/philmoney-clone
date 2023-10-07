import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:philmoney/common/Theme/colors.dart';
import 'package:philmoney/common/Theme/text_style.dart';

import 'package:philmoney/screen/history/widget/text_style.dart';
import 'package:philmoney/screen/remittance/controller.dart';

class RemittanceConfirmationBody extends GetView<RemittanceController> {
  const RemittanceConfirmationBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var receiver = controller.receiverInfo.value!;
    var remittance = controller.remittanceInfo.value!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: Get.height * 0.8,
          width: Get.width * 0.95,
          decoration: BoxDecoration(
              color: AppColors.primaryBackground,
              //color: Colors.blue,
              borderRadius: BorderRadius.circular(20)),
          // child: Expanded(
          child: Column(
            children: [
              _rowElements(
                  "Receiver",
                  " ${receiver.fname} ${receiver.mname} ${receiver.lname}"
                      .toUpperCase(),
                  null),
              _rowElements("TXN Type",
                  controller.remittanceState.txtType[receiver.type], null),
              receiver.type == '1'
                  ? Column(
                      children: [
                        _rowElements("", receiver.banks!.bankName,
                            receiver.banks!.bankIcon),
                        _rowElements(
                            "Acc. No.", receiver.banks!.accountNumber, null),
                      ],
                    )
                  : receiver.type == '2'
                      ? _rowElements("", receiver.pickup!.pickUpCenter,
                          receiver.pickup!.pickupIcon)
                      : _rowElements(
                          "Address", receiver.doorToDoor!.address, null),
              _rowElements("Purpose of \nRemittance", remittance.purpose, null),
              _rowElements(
                  "Mode of \nPayment",
                  remittance.modeOfPayment.storeName,
                  remittance.modeOfPayment.icon),
              _rowElements("Rate", remittance.rate, null),
              _amountRows('Amount to\nSend', remittance.amountSend),
              _amountRows('Service\nFee', remittance.serviceFee),
              remittance.discount != ''
                  ? _amountRows('Coupon', remittance.discount)
                  : Container(),
              _amountRows('Total \namount', remittance.amountSend),
              _amountRows('Amount to\nReceive', remittance.amountReceive),
              _rowElements(
                  "Payment\ndeadline", remittance.paymentDeadLine, null),
              _bankTextDetails(),
            ],
          ),
          // ),
        ),
        GestureDetector(
          onTap: () {
            controller.confirmAddNewRemittance();
            Future.delayed(
              const Duration(seconds: 1),
              () => _showAppRateScreen(),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(15),
            height: 50,
            width: Get.width * 0.9,
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
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
    );
  }
}

Future<dynamic> _showAppRateScreen() {
  return Get.defaultDialog(
      //title: 'Please Rate Us! Thank you',
      //textCancel: 'ok',
      cancel: TextButton(
          onPressed: () {
            Get.back();
          },
          child: HistoryTextStyle(
            title: 'Ok',
            fontSize: 16,
            fontColor: AppColors.submitButtonBlue,
          )),
      title: '',
      content: SizedBox(
        height: Get.height * 0.2,
        width: double.maxFinite,
        child: Column(
          children: [
            HistoryTextStyle(
              title: 'Please Rate Us!  Thank you',
              fontSize: 16,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStarButton(),
                _buildStarButton(),
                _buildStarButton(),
                _buildStarButton(),
                _buildStarButton(),
                _buildStarButton(),
                _buildStarButton(),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {},
                    child:
                        HistoryTextStyle(title: 'Dissatisfied', fontSize: 14)),
                // HistoryTextStyle(title: 'Dissatisfied', fontSize: 14),
                TextButton(
                    onPressed: () {},
                    child: HistoryTextStyle(title: 'Satisfied', fontSize: 14)),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              thickness: 2,
            ),
          ],
        ),
      ));
}

Widget _buildStarButton() {
  return SizedBox(
    height: 30,
    width: 30,
    child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.star,
          color: Colors.lightBlue,
        )),
  );
}

Widget _rowElements(title, elementText, image) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, top: 20),
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: image != null && title == ""
              ? SizedBox(
                  height: 30,
                  width: 30,
                  // color: Colors.red,
                  child: Image(image: AssetImage(image)),
                )
              : Text(
                  title,
                  style: smallText,
                ),
        ),
        Expanded(
            flex: 3,
            child: Row(
              children: [
                title == 'Mode of \nPayment'
                    ? Image.asset(
                        image,
                        height: 30,
                        width: 30,
                      )
                    : const SizedBox(
                        width: 1,
                      ),
                const SizedBox(
                  width: 5,
                ),
                HistoryTextStyle(
                  title: elementText,
                  fontSize: 14,
                  isColorRed: title == "Payment\ndeadline" ? true : false,
                ),
              ],
            ))
      ],
    ),
  );
}

Widget _amountRows(title, elementText) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            title,
            style: smallText,
          ),
        ),
        Expanded(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HistoryTextStyle(
                title: title == 'Amount to\nReceive' ? ": PHP" : ": NTD",
                fontSize: 14,
              ),
              HistoryTextStyle(
                title: elementText,
                fontSize: 14,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _bankTextDetails() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          '(Bank of Taiwan reference Exchange Rate 1 NTD= 1.614 PHP)',
          style: verySmallText,
        ),
        Text(
          'Easter Union Interactive Corp.',
          style: verySmallText,
        ),
        Text(
          'Foreign migrante worker small amount remmitance service license no. 11110001',
          style: verySmallText,
        ),
        Text(
          'License valid date : 2025-04-09',
          style: verySmallText,
        ),
        Text(
          'The transaction fund is protected and trusted by Taichung Commercial Bank',
          style: verySmallText,
        ),
      ],
    ),
  );
}
