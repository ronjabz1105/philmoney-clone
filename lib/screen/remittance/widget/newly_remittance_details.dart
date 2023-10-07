import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:philmoney/common/Theme/text_style.dart';
import 'package:philmoney/common/models/receiver.dart';
import 'package:philmoney/common/models/remittanceModel.dart';

import 'package:philmoney/common/widget/background.dart';
import 'package:philmoney/common/Theme/colors.dart';
import 'package:philmoney/common/widget/commonAppBar.dart';
import 'package:philmoney/screen/history/index.dart';

import 'package:philmoney/screen/remittance/controller.dart';

class NewlyRemittanceDetails extends StatelessWidget {
  const NewlyRemittanceDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.thirdElementText,
        body: SafeArea(
          child: Stack(
            children: [
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: MainBackground(),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: CommonAppbar(
                  isBack: false,
                ),
              ),
              const Positioned(
                top: 50,
                left: 10,
                child: NewlyRemittanceDetailsBody(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewlyRemittanceDetailsBody extends GetView<RemittanceController> {
  const NewlyRemittanceDetailsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReceiverModel receiver = controller.receiverInfo.value!;
    RemittanceModel remittance = controller.remittanceInfo.value!;

    return Container(
      height: Get.height * 0.9,
      width: Get.width * 0.95,
      decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          //color: Colors.blue,
          borderRadius: BorderRadius.circular(20)),
      child: SingleChildScrollView(
        child: Column(children: [
          //// top date
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              bottom: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Payment \n deadline  ',
                  style: verySmallText,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: HistoryTextStyle(
                    title: ' ${remittance.paymentDeadLine}',
                    fontColor: AppColors.iconColor,
                  ),
                ),
              ],
            ),
          ),

          PaymentBarcode(remittance: remittance),
          const SizedBox(height: 10),

          ///Timeline Progress indicator
          /// paid intransit or processed
          // _progressTimeline(remittance),
          ProgressTimeline(remittanceInfo: remittance),

          /// contact philMoney Button
          _buildContactButton(),

          /// Details of the Receiver
          _rowDetails('Referrence No.', remittance.referrenceNumber, false),
          _rowDetails(
              'Reciever .',
              "${receiver.fname} ${receiver.mname} ${receiver.lname}"
                  .capitalize,
              false),

          receiver.type == '1'
              ? _rowDetails('Txn type .', 'Bank to Bank', false)
              : receiver.type == '2'
                  ? _rowDetails('Txn type .', 'Pick Up', false)
                  : _rowDetails('Txn type .', 'Door To Door', false),
          // bank to bank and pick up
          _rowForReceiversOption(receiver),

          _rowDetailsWithIcon('Mode of Payment', remittance.modeOfPayment.icon,
              remittance.modeOfPayment.storeName),

          _rowDetails('Rate', remittance.rate, false),

          _rowAmountDetails('Amount to send', remittance.amountSend, false),
          _rowAmountDetails('Service Fee', remittance.serviceFee, false),
          _rowAmountDetails('Total Amount', remittance.totalAmount, true),
          _rowAmountDetails(
              'Amount to \nreceive', remittance.amountReceive, true),

          _rowDetails('Payment deadline', remittance.paymentDeadLine, true),
          const SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}

Widget _rowForReceiversOption(ReceiverModel receiver) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, top: 10),
    child: Column(
      children: [
        receiver.type == '1'
            ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.only(right: 30),
                            //color: Colors.amber,
                            height: 30,
                            width: 30,
                            child: Image(
                                image: AssetImage(
                              receiver.banks!.bankIcon,
                            )),
                          )),
                      Expanded(
                          flex: 2,
                          child: HistoryTextStyle(
                              title: receiver.banks!.bankName)),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Text(
                            'Account No.',
                            style: verySmallText,
                          )),
                      Expanded(
                          flex: 2,
                          child: HistoryTextStyle(
                              title: receiver.banks!.accountNumber)),
                    ],
                  ),
                  const SizedBox(height: 5),
                ],
              )
            : receiver.type == '2'
                ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                padding: const EdgeInsets.only(right: 30),
                                //color: Colors.amber,
                                height: 30,
                                width: 30,
                                child: Image(
                                    image: AssetImage(
                                  receiver.pickup!.pickupIcon,
                                )),
                              )),
                          Expanded(
                              flex: 2,
                              child: Text(receiver.pickup!.pickUpCenter)),
                        ],
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Address',
                              style: verySmallText,
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: HistoryTextStyle(
                                  title: receiver.doorToDoor!.address)),
                        ],
                      ),
                    ],
                  ),
      ],
    ),
  );
}

Widget _rowAmountDetails(titleText, dataText, isColorRed) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titleText,
                style: verySmallText,
              ),
              const Text(':'),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              titleText == 'Amount to \nreceive'
                  ? HistoryTextStyle(title: ' PHP')
                  : HistoryTextStyle(title: ' NTD'),
              HistoryTextStyle(
                title: dataText,
                isColorRed: isColorRed,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _rowDetailsWithIcon(titleText, icon, dataText) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            flex: 1,
            child: Text(
              titleText,
              style: verySmallText,
            )),
        Expanded(
            flex: 2,
            child: Row(
              children: [
                SizedBox(
                    width: 30,
                    height: 30,
                    child: Image(image: AssetImage(icon))),
                const SizedBox(width: 5),
                HistoryTextStyle(title: dataText),
              ],
            )),
      ],
    ),
  );
}

Widget _rowDetails(titleText, dataText, isColorRed) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            flex: 1,
            child: Text(
              titleText,
              style: verySmallText,
            )),
        Expanded(
            flex: 2,
            child: HistoryTextStyle(
              title: dataText,
              isColorRed: isColorRed,
            )),
      ],
    ),
  );
}

Widget _buildContactButton() {
  return GestureDetector(
    onTap: () {},
    child: Container(
      padding: const EdgeInsets.all(15),
      height: 60,
      width: Get.width * 0.7,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.warningText,
      ),
      child: const Text(
        'Contact PhilMoney Customer \n Service',
        style: TextStyle(
            fontSize: 14,
            color: AppColors.primaryElementText,
            fontWeight: FontWeight.normal),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
