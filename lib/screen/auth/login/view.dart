import 'package:flutter/material.dart';
import 'package:philmoney/common/Theme/colors.dart';
import 'package:philmoney/common/widget/background.dart';
import 'package:philmoney/common/widget/commonAppBar.dart';

import 'index.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const Appbar(),
      backgroundColor: AppColors.thirdElementText,
      body: SafeArea(
        child: Stack(children: [
          const MainBackground(),
          CommonAppbar(
            title: "Login",
          ),
          const LoginScreenBody()
        ]),
      ),
    );
  }
}
