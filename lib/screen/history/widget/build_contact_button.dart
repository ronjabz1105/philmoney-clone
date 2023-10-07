import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:philmoney/common/Theme/colors.dart';

class BuildContactButton extends StatelessWidget {
  const BuildContactButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
