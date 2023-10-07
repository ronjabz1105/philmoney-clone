import 'package:flutter/cupertino.dart';
import 'package:philmoney/common/Theme/colors.dart';

class CommonTextStyle extends StatelessWidget {
  CommonTextStyle({
    Key? key,
    required this.title,
    this.fontColor = AppColors.thirdElement,
    this.fontSize = 12,
  }) : super(key: key);

  String title;
  Color fontColor;
  double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: fontColor,
        fontSize: fontSize,
        fontFamily: 'Montserrat',
      ),
    );
  }
}
