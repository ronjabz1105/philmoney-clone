import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:philmoney/common/Theme/colors.dart';
import 'package:philmoney/common/Theme/text_style.dart';
import 'package:philmoney/common/models/receiver.dart';
import 'package:philmoney/common/models/remittanceModel.dart';
import 'package:philmoney/common/routes/names.dart';
import 'package:philmoney/screen/history/index.dart';

class RemittanceHistoryBuildTabBar extends GetView<HistoryController> {
  const RemittanceHistoryBuildTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1.5,
              color: AppColors.primaryBackground,
            ),
            color: AppColors.submitButtonBlue,
          ),
          child: TabBar(
              labelColor: AppColors.submitButtonBlue,
              unselectedLabelColor: AppColors.primaryBackground,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: AppColors.primaryBackground,
              ),
              tabs: const [
                Tab(text: "Paid"),
                Tab(text: "Unpaid"),
                Tab(text: "Expired"),
              ]),
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          child: Container(
            height: Get.height * 0.8,
            width: Get.width * 0.95,
            padding: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                color: AppColors.primaryBackground,
                borderRadius: BorderRadius.circular(20)),
            child: TabBarView(children: [
              Column(
                children: [
                  Expanded(
                    child: Obx(() => controller.isLoading.value
                        ? RemittanceHistoryHolderScreen(
                            listCount: controller.paidRemittance.value,
                          )
                        : ListView.builder(
                            // itemCount: controller.allPaidRemittance.length,
                            itemCount: controller.allPaidRemittance.length,
                            itemBuilder: (context, index) {
                              RemittanceModel remittance =
                                  controller.allPaidRemittance[index];

                              ReceiverModel receiver =
                                  controller.allReceiverPaidRemittance[index];

                              return _buildRemittanceDetails(
                                  remittance, receiver);
                            })),
                  ),
                ],
              ),
              Column(
                children: [
                  Expanded(
                    child: Obx(
                      () => controller.isLoading.value
                          ? RemittanceHistoryHolderScreen(
                              listCount: controller.unpaidRemittance.value,
                            )
                          : ListView.builder(
                              itemCount: controller.allUnpaidRemittance.length,
                              itemBuilder: (context, index) {
                                RemittanceModel remittance =
                                    controller.allUnpaidRemittance[index];
                                ReceiverModel receiver = controller
                                    .allReceiverUnpaidRemittance[index];

                                return _buildRemittanceDetails(
                                    remittance, receiver);
                              }),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Expanded(
                    child: Obx(
                      () => ListView.builder(
                          itemCount: controller.allExpiredRemittance.length,
                          itemBuilder: (context, index) {
                            RemittanceModel remittance =
                                controller.allExpiredRemittance[index];
                            ReceiverModel receiver =
                                controller.allReceiverExpiredRemittance[index];

                            return _buildRemittanceDetails(
                                remittance, receiver);
                          }),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ],
    );
  }
}

Widget _buildRemittanceDetails(
    RemittanceModel remittanceInfo, ReceiverModel receiver) {
  return GestureDetector(
    onTap: () {
      // print(remittanceInfo.id);
      Get.toNamed(AppRoutes.REMITTANCEDETAILS, parameters: {
        'remittanceId': '${remittanceInfo.id}',
        'receiverId': '${receiver.id}'
      });
    },
    child: Column(
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, top: 10),
                height: 100,
                // color: Colors.amber,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      height: 80,
                      width: 80,
                      fit: BoxFit.fill,
                      image: AssetImage(remittanceInfo.modeOfPayment.icon),
                    ),
                    Text(
                      remittanceInfo.modeOfPayment.storeName,
                      style: smallText,
                    ),
                  ],
                ),
              ),

              /// vertical devider
              const SizedBox(height: 5),
              const VerticalDivider(
                // height: 1,
                thickness: 1,
                color: AppColors.thirdElementText,
              ),

              ///// Row for Receivers details
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(''),
                    Text(receiver.relationship),
                    Text(
                      '${receiver.fname} ${receiver.mname} ${receiver.lname}'
                          .toUpperCase(),
                      overflow: TextOverflow.ellipsis,
                      style: receiverTextInRemittance,
                    ),
                    receiver.type == '1'
                        ? Text(
                            'Bank to Bank',
                            style: verySmallText,
                          )
                        : receiver.type == '2'
                            ? Text(
                                'Pick up',
                                style: verySmallText,
                              )
                            : Text(
                                'Door to Door',
                                style: verySmallText,
                              ),
                  ],
                ),
              ),

              ///// Row for remittance details
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        remittanceInfo.date,
                        style: verySmallText,
                      ),
                      Text('PHP ${remittanceInfo.amountReceive}',
                          style: amountReceiveStyle),
                      Text(
                        'NTD ${remittanceInfo.amountSend}',
                      ),
                      remittanceInfo.status == "paid"
                          ? HistoryTextStyle(
                              title: "paid",
                              fontColor: AppColors.primaryElementStatus,
                            )
                          : remittanceInfo.status == "unpaid"
                              ? HistoryTextStyle(
                                  title: "waiting",
                                  fontColor: AppColors.primaryElementStatus,
                                )
                              : HistoryTextStyle(
                                  title: "expired",
                                  isColorRed: true,
                                ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        const Divider(
          height: 1,
          thickness: 1,
          color: AppColors.thirdElementText,
        ),
        const SizedBox(height: 5),
      ],
    ),
  );
}
