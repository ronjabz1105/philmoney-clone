import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:philmoney/common/Theme/colors.dart';
import 'package:philmoney/common/Theme/text_style.dart';
import 'package:philmoney/screen/remittance/widget/textField_decoration.dart';

import '../index.dart';

class BuildMainBody extends GetView<RemittanceController> {
  const BuildMainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Get.height * 0.8,
          width: Get.width * 0.95,
          decoration: BoxDecoration(
              color: AppColors.primaryBackground,
              //color: Colors.blue,
              borderRadius: BorderRadius.circular(20)),
          child: Obx(
            () => SingleChildScrollView(
              //reverse: true,
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          onTap: () {
                            controller.goToModeOfPaymentPage();
                          },
                          controller: controller.modOfPayment,
                          //enabled: false,
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: "Mode of Payment",
                            label: const Text("Mode of Payment",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.primaryElement)),
                            suffix: Image(
                              height: 50,
                              width: 50,
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  controller.paymentIcon.value.toString()),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          onTap: () {
                            controller.goToReceiversList();
                          },
                          controller: controller.receiverController,
                          //enabled: false,
                          readOnly: true,
                          decoration: const InputDecoration(
                            hintText: "Select Receiver",
                            label: Text("Select Receiver",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.primaryElement)),
                          ),
                        ),

                        Obx(
                          () => controller.hasDetails.value
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 10, right: 10),
                                  child: Column(
                                    children: [
                                      controller.receiverInfo.value!.type == '3'
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Complete Address",
                                                  style: smallText,
                                                ),
                                                Text(
                                                  controller.receiverInfo.value!
                                                      .cityProvince,
                                                  style: smallText,
                                                ),
                                              ],
                                            )
                                          : controller.receiverInfo.value!
                                                      .type ==
                                                  '2'
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      height: 30,
                                                      width: 60,
                                                      child: Image(
                                                          fit: BoxFit.contain,
                                                          image: AssetImage(
                                                              controller
                                                                  .receiverInfo
                                                                  .value!
                                                                  .pickup!
                                                                  .pickupIcon)),
                                                    ),
                                                    Text(
                                                      controller
                                                          .receiverInfo
                                                          .value!
                                                          .pickup!
                                                          .pickUpCenter,
                                                      style: smallText,
                                                    ),
                                                  ],
                                                )
                                              : Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      height: 30,
                                                      width: 60,
                                                      child: Image(
                                                          fit: BoxFit.contain,
                                                          image: AssetImage(
                                                              controller
                                                                  .receiverInfo
                                                                  .value!
                                                                  .banks!
                                                                  .bankIcon)),
                                                    ),
                                                    Text(
                                                      controller
                                                          .receiverInfo
                                                          .value!
                                                          .banks!
                                                          .bankName,
                                                      style: smallText,
                                                    ),
                                                  ],
                                                ),
                                      controller.receiverInfo.value!.type == "1"
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Acc. No.',
                                                  style: smallText,
                                                ),
                                                Text(
                                                  controller.receiverInfo.value!
                                                      .banks!.accountNumber,
                                                  style: smallText,
                                                ),
                                              ],
                                            )
                                          : controller.receiverInfo.value!
                                                      .type ==
                                                  "3"
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Contact No.',
                                                        style: smallText,
                                                      ),
                                                      Text(
                                                        controller
                                                            .receiverInfo
                                                            .value!
                                                            .contactNumber,
                                                        style: smallText,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : const SizedBox(width: 1),
                                    ],
                                  ),
                                )
                              : Container(),
                        ),

                        const SizedBox(height: 30),
                        //Select Purpose
                        TextFieldDecoration(
                          textController: controller.purposeController,
                          hintText: "Select Purpose",
                          titleText: "Purpose of \n Remittance",
                          readOnly: true,
                          selectPurpose: true,
                          isNumber: false,
                          prefix: '',
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFieldDecoration(
                              textController: controller.currencyController,
                              hintText: "PHP",
                              titleText: "Currency",
                              readOnly: true,
                              isNumber: false,
                              prefix: '',
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 100.0),
                              child: Text(
                                controller.rate,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  color: AppColors.submitButtonBlue,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),

                        TextFieldDecoration(
                          textController: controller.amountSendController,
                          hintText: "0",
                          titleText: "Amount to \n Send",
                          txtAlignCenter: false,
                          updateSendValue: false,
                        ),

                        TextFieldDecoration(
                          textController: controller.amountReceiveController,
                          hintText: "0",
                          titleText: "Amount to \n Receive",
                          txtAlignCenter: false,
                          prefix: 'PHP',
                        ),
                        TextFieldDecoration(
                          textController: controller.couponController,
                          hintText: "Select Coupon",
                          titleText: "Coupon ",
                          readOnly: true,
                          coupon: true,
                          prefix: '',
                        ),

                        TextFieldDecoration(
                          textController: controller.discountController,
                          hintText: "0",
                          titleText: "Discount",
                          txtAlignCenter: false,
                          prefix: 'NTD',
                          readOnly: true,
                          borderColor: AppColors.thirdElementText,
                        ),
                        TextFieldDecoration(
                          textController: controller.serviceFeeController,
                          hintText: "100",
                          titleText: "Service Fee",
                          txtAlignCenter: false,
                          prefix: 'NTD',
                          readOnly: true,
                          borderColor: AppColors.thirdElementText,
                        ),
                        TextFieldDecoration(
                          textController: controller.totalAmountController,
                          hintText: "0",
                          titleText: "Total \n Amount",
                          txtAlignCenter: false,
                          prefix: 'NTD',
                          readOnly: true,
                          borderColor: AppColors.thirdElementText,
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "(Bank of Taiwan reference Exchange Rate 1 NTD = 1.602 PHP)",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              // fontFamily: "Avenir",
                              fontSize: 10,
                              color: AppColors.primaryThreeElementText),
                        )
                      ]),
                ),
              ),
            ),
          ),
        ),
        // _builSubmitButton(),
        GestureDetector(
          onTap: () {
            controller.addNewRemittance();
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
