import 'package:flutter/material.dart';
import 'package:philmoney/common/Theme/text_style.dart';

import '../index.dart';

class RemittanceRowDetails extends StatelessWidget {
  RemittanceRowDetails(
      {Key? key,
      required this.dataText,
      required this.titleText,
      required this.isColorRed})
      : super(key: key);

  bool isColorRed;
  String titleText;
  String dataText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Text(
                titleText,
                style: verySmallText,
              )),
          Expanded(
              flex: 2,
              child: HistoryTextStyle(
                title: dataText,
                isColorRed: isColorRed,
              )),
        ],
      ),
    );
  }
}
