import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:philmoney/common/Theme/colors.dart';
import 'package:philmoney/common/widget/background.dart';
import 'package:philmoney/common/widget/commonAppBar.dart';
import 'package:philmoney/screen/remittance/index.dart';

import 'index.dart';

class ModeOfPaymentsPage extends StatelessWidget {
  const ModeOfPaymentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: CommonAppbar(title: "Philmoney"),
            ),
            const Positioned(
              top: 50,
              left: 10,
              child: BuildInputBody(),
            )
          ],
        ),
      ),
    );
  }
}

class BuildInputBody extends GetView<RemittanceController> {
  const BuildInputBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.8,
      width: Get.width * 0.95,
      decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(20)),
      child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                controller.selectModeOfPayment(
                    ModeOfPaymentState().modeOfPaymentList[index], index);
              },
              child: Container(
                padding: const EdgeInsets.only(left: 15, top: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          ModeOfPaymentState().modeOfPaymentListIcons[index],
                          height: 60,
                          width: 60,
                        ),
                        const SizedBox(width: 15),
                        Text(
                          ModeOfPaymentState().modeOfPaymentList[index],
                        ),
                      ],
                    ),
                    const Divider(
                      height: 15,
                      thickness: 2,
                      //color: Colors.red,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
