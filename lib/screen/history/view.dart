import 'package:flutter/material.dart';
import 'package:philmoney/common/Theme/colors.dart';
import 'package:philmoney/common/widget/background.dart';
import 'package:philmoney/common/widget/commonAppBar.dart';

import 'index.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({Key? key, this.intialIndex = 1}) : super(key: key);
  int intialIndex;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: intialIndex,
        length: 3,
        child: Scaffold(
          backgroundColor: AppColors.thirdElementText,
          body: SafeArea(
            child: Stack(children: [
              const MainBackground(),
              CommonAppbar(
                title: "History",
              ),
              const Positioned(
                  top: 50,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: RemittanceHistoryBuildTabBar()),
            ]),
          ),
        ));
  }
}
