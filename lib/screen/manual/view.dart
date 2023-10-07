import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:philmoney/common/Theme/colors.dart';
import 'package:philmoney/common/widget/background.dart';
import 'package:philmoney/common/widget/commonAppBar.dart';

class ManualScreen extends StatelessWidget {
  const ManualScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.thirdElementText,
      body: SafeArea(
        child: Stack(children: [
          const MainBackground(),
          CommonAppbar(
            title: "User Manual",
          ),
          Positioned(
            top: 50,
            left: 10,
            child: ManualBody(),
          ),
        ]),
      ),
    );
  }
}

Widget ManualBody() {
  return Container(
    height: Get.height * 0.85,
    width: Get.width * 0.95,
    //padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: AppColors.primaryBackground,
      //color: Colors.blue,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          "FAQ",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        RichText(
          selectionColor: Colors.amber,
          text: const TextSpan(
            text: "1. How to download PhilMoney App",
          ),
        ),
      ],
    ),
  );
}
