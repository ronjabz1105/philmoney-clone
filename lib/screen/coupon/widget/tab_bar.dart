import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:philmoney/common/Theme/colors.dart';
import 'package:philmoney/screen/receiver/index.dart';

class CouponBuildTabBar extends GetView<ReceiverController> {
  const CouponBuildTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                Tab(text: "Coupon"),
                Tab(text: "Voucher"),
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
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SizedBox(
                      height: 50,
                      width: 250,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.submitButtonBlue),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.submitButtonBlue),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              )),
                          hintText: "Code",
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 80,
                      decoration: const BoxDecoration(
                        color: AppColors.submitButtonBlue,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Add",
                          style: TextStyle(
                            color: AppColors.primaryElementText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ]),
                ],
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
