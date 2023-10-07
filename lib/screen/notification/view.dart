import 'package:flutter/material.dart';
import 'package:philmoney/common/Theme/colors.dart';
import 'package:philmoney/common/widget/background.dart';
import 'package:philmoney/common/widget/commonAppBar.dart';

import 'index.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: AppColors.thirdElementText,
          body: SafeArea(
            child: Stack(children: [
              const MainBackground(),
              CommonAppbar(
                title: "Notification",
              ),
              const Positioned(
                  top: 50,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: NotificationBuildTabBar()),
            ]),
          ),
        ));
  }
}
