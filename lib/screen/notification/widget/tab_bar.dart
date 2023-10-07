import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:philmoney/common/Theme/colors.dart';
import 'package:philmoney/screen/receiver/index.dart';

class NotificationBuildTabBar extends GetView<ReceiverController> {
  const NotificationBuildTabBar({Key? key}) : super(key: key);

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
                // border: Border.all(
                //   width: 1.5,
                //   color: AppColors.primaryBackground,
                // ),
                color: AppColors.primaryBackground,
              ),
              tabs: const [
                Tab(text: "Personal"),
                Tab(text: "Announcement"),
                //Tab(text: "Door to Door"),
              ]),
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          child: Container(
            height: Get.height * 0.8,
            width: Get.width * 0.95,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: AppColors.primaryBackground,
                borderRadius: BorderRadius.circular(20)),
            child: TabBarView(children: [
              Column(
                children: const [],
              ),
              Column(
                children: const [
                  // Divider(
                  //   height: 1,
                  //   thickness: 1,
                  //   color: AppColors.thirdElementText,
                  // )
                ],
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
