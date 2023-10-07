import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:philmoney/common/Theme/colors.dart';
import 'package:philmoney/screen/auth/login/index.dart';

class TextController extends GetView<LoginController> {
  const TextController({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.only(left: 10),
          height: 50,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.primaryBackground,
              boxShadow: const [
                BoxShadow(
                    color: AppColors.thirdElementText,
                    blurRadius: 1,
                    spreadRadius: 2),
              ]),
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: controller.phoneNumberController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Phone Number",
              fillColor: AppColors.thirdElementText,
              prefixIcon: Icon(
                Icons.phone,
                color: AppColors.submitButton,
              ),
            ),
            obscureText: false,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.only(left: 10),
          height: 50,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.primaryBackground,
              boxShadow: const [
                BoxShadow(
                    color: AppColors.thirdElementText,
                    blurRadius: 1,
                    spreadRadius: 1),
              ]),
          child: Obx(
            () => TextFormField(
              controller: controller.passwordController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Password",
                fillColor: AppColors.thirdElementText,
                prefixIcon: const Icon(
                  Icons.lock_outline_rounded,
                  color: AppColors.submitButton,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    controller.obscureText.value =
                        !controller.obscureText.value;
                  },
                  child: Icon(
                    controller.obscureText.value
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    size: 30,
                    color: AppColors.submitButton,
                  ),
                ),
              ),
              obscureText: controller.obscureText.value,
              obscuringCharacter: '*',
            ),
          ),
        ),
      ],
    );
  }
}
