import 'package:flutter/material.dart';
import 'package:philmoney/common/Theme/colors.dart';
import 'package:philmoney/common/widget/background.dart';
import 'package:philmoney/common/widget/commonAppBar.dart';
import 'package:philmoney/screen/settings/widget/settings_body.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.thirdElementText,
      body: SafeArea(
        child: Stack(children: [
          const MainBackground(),
          CommonAppbar(
            title: "Settings",
          ),
          const Positioned(
            top: 50,
            left: 10,
            child: SettingsBody(),
          ),
        ]),
      ),
    );
  }
}
