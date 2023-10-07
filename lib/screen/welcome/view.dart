import 'package:flutter/material.dart';
import 'package:philmoney/common/Theme/colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: Center(
          child: Image(
        image: AssetImage('assets/images/logo.png'),
      )),
    );
  }
}
