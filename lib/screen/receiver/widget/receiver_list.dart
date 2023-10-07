import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:philmoney/common/Theme/colors.dart';
import 'package:philmoney/common/Theme/text_style.dart';
import 'package:philmoney/common/models/receiver.dart';
import 'package:philmoney/screen/receiver/index.dart';

class ReceiversListScreen extends GetView<ReceiverController> {
  const ReceiversListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.95,
      child: SingleChildScrollView(
        child: Column(
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
                    // Row(children: const [Tab(text: "Bank to bank")]),
                    Tab(text: "Bank to bank"),
                    Tab(text: "Pick up"),
                    Tab(text: "Door to Door"),
                  ]),
            ),
            const SizedBox(height: 20),
            Container(
              height: Get.height * 0.8,
              width: Get.width * 0.95,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppColors.primaryBackground,
                  borderRadius: BorderRadius.circular(20)),
              child: TabBarView(children: [
////// ============ BANK TO BANK COLUMN ============//////

                Column(
                  children: [
                    Expanded(
                      child: Obx(
                        () => ListView.builder(
                          itemCount: controller.allReceiversBanks.length,
                          itemBuilder: (context, index) {
                            int receiverLenght =
                                controller.allReceiversBanks.length - 1;

                            ReceiverModel receiver =
                                controller.allReceiversBanks[index];

                            return GetBuilder<ReceiverController>(
                                id: "bank_receiver",
                                builder: (context) {
                                  return Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                if (controller
                                                    .remittanceController
                                                    .getReceiver
                                                    .value) {
                                                  controller
                                                      .remittanceController
                                                      .getTheReciverForThisRemittance(
                                                          receiver.id);
                                                }
                                              },
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    height: 60,
                                                    width: 100,
                                                    child: Image(
                                                        fit: BoxFit.fill,
                                                        image: AssetImage(
                                                            receiver.banks!
                                                                .bankIcon)),
                                                  ),
                                                  SizedBox(
                                                    height: 60,
                                                    width: 200,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '${receiver.fname}  ${receiver.mname} ${receiver.lname}'
                                                              .toUpperCase(),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: receiverName,
                                                        ),
                                                        Text(
                                                          receiver
                                                              .banks!.bankName,
                                                          style:
                                                              receiverTextBold,
                                                        ),
                                                        Text(
                                                          receiver
                                                              .contactNumber,
                                                          style: smallText,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            controller.remittanceController
                                                    .getReceiver.value
                                                ? Container()
                                                : OutlinedButton(
                                                    onPressed: () {
                                                      controller
                                                          .goToUpdateReceiver(
                                                        receiver,
                                                      );
                                                    },
                                                    child: const Text('Edit'),
                                                  ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      const Divider(
                                        height: 1,
                                        thickness: 1,
                                        color: AppColors.thirdElementText,
                                      ),
                                      // index == receiverLenght
                                      //     ? GestureDetector(
                                      //         onTap: () {
                                      //           controller
                                      //               .goToAddNewReceiver('1');
                                      //         },
                                      //         child: _buildPlusImage(),
                                      //       )
                                      //     : Container(),
                                    ],
                                  );
                                });
                          },
                        ),
                      ),
                    ),
                    // controller.allReceiversBanks.isEmpty ||
                    //         controller.allReceiversBanks == 0
                    //     ?
                    GestureDetector(
                      onTap: () {
                        controller.goToAddNewReceiver('1');
                      },
                      child: _buildPlusImage(),
                    )
                    // : const SizedBox(
                    //     height: 1,
                    //   ),
                  ],
                ),

                Column(
                  children: [
                    ////// ============ PICK UP COLUMN ============//////

                    Expanded(
                      child: Obx(
                        () => ListView.builder(
                            itemCount: controller.allReceiversPickUp.length,
                            itemBuilder: (context, index) {
                              ReceiverModel receiver =
                                  controller.allReceiversPickUp[index];
                              return GetBuilder<ReceiverController>(
                                  id: "pickup_receiver",
                                  builder: (context) {
                                    return Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  if (controller
                                                      .remittanceController
                                                      .getReceiver
                                                      .value) {
                                                    controller
                                                        .remittanceController
                                                        .getTheReciverForThisRemittance(
                                                            receiver.id);
                                                  }
                                                },
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      height: 60,
                                                      width: 100,
                                                      child: Image(
                                                          fit: BoxFit.fill,
                                                          image: AssetImage(
                                                              receiver.pickup!
                                                                  .pickupIcon)),
                                                    ),
                                                    SizedBox(
                                                      height: 60,
                                                      width: 200,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '${receiver.fname}  ${receiver.mname} ${receiver.lname}'
                                                                .toUpperCase(),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: receiverName,
                                                          ),
                                                          Text(
                                                            receiver.pickup!
                                                                .pickUpCenter,
                                                            style:
                                                                receiverTextBold,
                                                          ),
                                                          Text(
                                                            '${receiver.contactNumber}  ',
                                                            style: smallText,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              controller.remittanceController
                                                      .getReceiver.value
                                                  ? Container()
                                                  : OutlinedButton(
                                                      onPressed: () {
                                                        controller
                                                            .goToUpdateReceiver(
                                                          receiver,
                                                        );
                                                      },
                                                      child: const Text('Edit'),
                                                    )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        const Divider(
                                          height: 1,
                                          thickness: 1,
                                          color: AppColors.thirdElementText,
                                        ),
                                        // index ==
                                        //         controller.allReceiversPickUp
                                        //                 .length -
                                        //             1
                                        //     ? GestureDetector(
                                        //         onTap: () {
                                        //           controller
                                        //               .goToAddNewReceiver('2');
                                        //         },
                                        //         child: _buildPlusImage(),
                                        //       )
                                        //     : Container(),
                                      ],
                                    );
                                  });
                            }),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        controller.goToAddNewReceiver('2');
                      },
                      child: _buildPlusImage(),
                    )
                  ],
                ),
                Column(
                  children: [
                    ////// ============ DOOR TO DOOR ============//////

                    Expanded(
                      child: Obx(
                        () => ListView.builder(
                            itemCount: controller.allReceiversDoorToDoor.length,
                            itemBuilder: (context, index) {
                              ReceiverModel receiver =
                                  controller.allReceiversDoorToDoor[index];

                              return GetBuilder<ReceiverController>(
                                  id: 'doortodoor_receiver',
                                  builder: (context) {
                                    return Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0, left: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  if (controller
                                                      .remittanceController
                                                      .getReceiver
                                                      .value) {
                                                    controller
                                                        .remittanceController
                                                        .getTheReciverForThisRemittance(
                                                            receiver.id);
                                                  }
                                                },
                                                child: Row(
                                                  children: [
                                                    Container(
                                                        padding:
                                                            const EdgeInsets.all(
                                                                5),
                                                        height: 70,
                                                        width: 70,
                                                        decoration: BoxDecoration(
                                                            color: AppColors
                                                                .thirdElementText,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        35)),
                                                        child: Center(
                                                          child: Text(
                                                            receiver
                                                                .relationship,
                                                            style: smallText,
                                                          ),
                                                        )),
                                                    const SizedBox(width: 5),
                                                    SizedBox(
                                                      height: 60,
                                                      width: 200,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '${receiver.fname}  ${receiver.mname} ${receiver.lname}'
                                                                .toUpperCase(),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: receiverName,
                                                          ),
                                                          Text(
                                                            receiver
                                                                .contactNumber,
                                                            style:
                                                                receiverTextBold,
                                                          ),
                                                          Text(
                                                            receiver
                                                                .cityProvince,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: smallText,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              controller.remittanceController
                                                      .getReceiver.value
                                                  ? Container()
                                                  : OutlinedButton(
                                                      onPressed: () {
                                                        controller
                                                            .goToUpdateReceiver(
                                                                receiver);
                                                      },
                                                      child: const Text('Edit'),
                                                    ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        const Divider(
                                          height: 1,
                                          thickness: 1,
                                          color: AppColors.thirdElementText,
                                        ),
                                        // index ==
                                        //         controller
                                        //                 .allReceiversDoorToDoor
                                        //                 .length -
                                        //             1
                                        //     ? GestureDetector(
                                        //         onTap: () {
                                        //           controller
                                        //               .goToAddNewReceiver('3');
                                        //         },
                                        //         child: _buildPlusImage(),
                                        //       )
                                        //     : Container(),
                                      ],
                                    );
                                  });
                            }),
                      ),
                    ),

                    // controller.allReceiversDoorToDoor.isEmpty
                    // ?
                    GestureDetector(
                      onTap: () {
                        controller.goToAddNewReceiver('3');
                      },
                      child: _buildPlusImage(),
                    )
                    // : Container(),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildPlusImage() {
  return const Padding(
    padding: EdgeInsets.only(top: 12.0),
    child: Image(
      image: AssetImage('assets/icons/plus.png'),
      height: 70,
      width: 70,
      color: Colors.red,
    ),
  );
}
