import 'package:flutter/cupertino.dart';
import 'package:philmoney/common/Theme/colors.dart';

class HistoryTextStyle extends StatelessWidget {
  HistoryTextStyle(
      {Key? key,
      required this.title,
      this.fontColor = AppColors.thirdElement,
      this.fontSize = 12,
      this.isColorRed = false})
      : super(key: key);

  String title;
  Color fontColor;
  double fontSize;
  bool isColorRed;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: isColorRed ? AppColors.warningText : fontColor,
        fontSize: fontSize,
        fontFamily: 'Montserrat',
      ),
    );
  }
}
