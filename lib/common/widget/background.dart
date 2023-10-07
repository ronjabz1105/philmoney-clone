import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:philmoney/common/Theme/colors.dart';

class MainBackground extends StatelessWidget {
  const MainBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: Get.height * 0.3,
        width: double.maxFinite,
        color: AppColors.submitButtonBlue,
      ),
    );
  }
}

// Widget mainBackground() {
//   return Container(
//     height: Get.height * 0.3,
//     width: double.maxFinite,
//     color: AppColors.submitButtonBlue,
//   );
// }
