import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:philmoney/common/Theme/colors.dart';
import 'package:philmoney/common/widget/text_style.dart';

import '../index.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 50,
        left: 10,
        child: Container(
          height: Get.height * 0.85,
          width: Get.width * 0.95,
          //padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            //color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              // icon
              _buildTheDollarIcon(),

              const TextController(),
              _buildForgotPassword(),
              const LoginButton(),
            ],
          ),
        ));
  }
}

_buildTheDollarIcon() {
  return const SizedBox(
    //color: Colors.green,
    height: 100,
    width: 100,
    child: Image(
      color: Colors.red,
      image: AssetImage('assets/icons/remit.png'),
    ),
  );
}

_buildForgotPassword() {
  return Padding(
    padding: const EdgeInsets.only(top: 10, right: 10),
    child: Align(
      alignment: Alignment.centerRight,
      child: CommonTextStyle(
        title: 'Forgot Password',
        fontColor: AppColors.secondaryElementText,
      ),
    ),
  );
}

class LoginButton extends GetView<LoginController> {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.login();
      },
      child: Obx(
        () => Container(
          height: 40,
          width: 300,
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.submitButton),
          child: Center(
              child: Text(
            'Login ${controller.verificationCode}',
            style: const TextStyle(
                fontSize: 16, color: AppColors.primaryElementText),
          )),
        ),
      ),
    );
  }
}
