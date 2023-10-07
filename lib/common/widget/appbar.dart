import 'package:flutter/material.dart';
import 'package:philmoney/common/Theme/colors.dart';

class Appbar extends StatelessWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.submitButtonBlue,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'PhilM',
            style: TextStyle(
              fontFamily: "Avenir",
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image(
            image: AssetImage('assets/icons/coin.png'),
            height: 12,
            width: 12,
            color: Colors.white,
          ),
          Text(
            'ney',
            style: TextStyle(
              fontFamily: "Avenir",
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
