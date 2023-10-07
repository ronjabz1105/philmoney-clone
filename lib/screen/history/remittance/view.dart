import 'package:flutter/material.dart';
import 'package:philmoney/common/Theme/colors.dart';
import 'package:philmoney/common/widget/background.dart';
import 'package:philmoney/common/widget/commonAppBar.dart';
import 'package:philmoney/screen/history/remittance/remittance_details.dart';

class HistoryRemittanceDetails extends StatelessWidget {
  HistoryRemittanceDetails(
      {Key? key,
      required this.remittanceId,
      required this.receiversId,
      this.isBack = true})
      : super(key: key);
  String remittanceId;
  String receiversId;
  bool isBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.thirdElementText,
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
              child: CommonAppbar(
                isBack: isBack,
              ),
            ),
            Positioned(
              top: 50,
              left: 10,
              child: RemittanceDetails(
                thisremittanceId: remittanceId,
                thisreceiverId: receiversId,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
