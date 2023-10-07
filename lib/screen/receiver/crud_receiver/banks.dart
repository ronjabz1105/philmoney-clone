import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:philmoney/common/Theme/colors.dart';
import 'package:philmoney/common/widget/background.dart';
import 'package:philmoney/common/widget/commonAppBar.dart';
import 'package:philmoney/screen/receiver/controller.dart';

class BankListsScreen extends GetView<ReceiverController> {
  const BankListsScreen({Key? key}) : super(key: key);

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
              child: CommonAppbar(title: controller.bankHintText.value),
            ),
            const Positioned(
              top: 50,
              left: 10,
              child: BanksList(),
            )
          ],
        ),
      ),
    );
  }
}

class BanksList extends GetView<ReceiverController> {
  const BanksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.85,
      width: Get.width * 0.95,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(20)),
      child: ListView.builder(
          itemCount: controller.receiversOption.value == '1'
              ? controller.state.bankIconsPath.length
              : controller.state.pickupCenterIconsPath.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    controller.updateBankNameController(index);
                  },
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        height: 50,
                        width: 80,
                        child: Image(
                          fit: BoxFit.fill,
                          image: controller.receiversOption.value == '1'
                              ? AssetImage(
                                  controller.state.bankIconsPath[index])
                              : AssetImage(controller
                                  .state.pickupCenterIconsPath[index]),
                        ),
                      ),
                      controller.receiversOption.value == '1'
                          ? Text(controller.state.banksName[index])
                          : Text(controller.state.pickUpCenters[index]),
                    ],
                  ),
                ),
                const Divider(
                  // height: 30,
                  thickness: 1,
                  color: AppColors.thirdElementText,
                ),
              ],
            );
          }),
    );
  }
}

Widget _build(text, controller) {
  return GestureDetector(
    onTap: () {
      controller.updateRelationshipController(text);
    },
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        text,
        style: const TextStyle(
            color: AppColors.fourElementText,
            fontSize: 20,
            fontWeight: FontWeight.normal),
      ),
    ),
  );
}
