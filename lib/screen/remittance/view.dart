import 'package:flutter/material.dart';

import 'package:philmoney/common/widget/background.dart';
import 'package:philmoney/common/Theme/colors.dart';
import 'package:philmoney/common/widget/commonAppBar.dart';
import 'package:philmoney/screen/remittance/index.dart';

class RemittanceScreen extends StatelessWidget {
  RemittanceScreen({Key? key, this.isConfirmation = false}) : super(key: key);
  bool isConfirmation; // 0- main, 1 confirmtaion,
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.thirdElementText,
        body: SafeArea(
          child: Stack(
            children: [
              const MainBackground(),
              CommonAppbar(),
              Positioned(
                top: 50,
                left: 10,
                child: isConfirmation
                    ? const RemittanceConfirmationBody()
                    : const BuildMainBody(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
