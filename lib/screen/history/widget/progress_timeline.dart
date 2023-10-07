import 'package:flutter/material.dart';
import 'package:philmoney/common/Theme/colors.dart';
import 'package:philmoney/common/Theme/text_style.dart';
import 'package:philmoney/common/models/remittanceModel.dart';

import '../index.dart';

class ProgressTimeline extends StatelessWidget {
  ProgressTimeline({Key? key, required this.remittanceInfo}) : super(key: key);

  RemittanceModel remittanceInfo;
  @override
  Widget build(BuildContext context) {
    var color = AppColors.primaryElementStatus;
    if (remittanceInfo.status == 'expired') {
      color = AppColors.thirdElementText;
    }
    return remittanceInfo.status == "unpaid"
        ? Center(
            child: HistoryTextStyle(
              title: 'Unpaid',
              isColorRed: true,
            ),
          )
        : SizedBox(
            height: 100,
            width: double.maxFinite,
            //color: Colors.grey[200],
            child: Stack(
              children: [
                Positioned(
                  left: 100,
                  right: 50,
                  child: Row(
                    children: [
                      SizedBox(
                          height: 35,
                          width: 35,
                          child:
                              Image.asset(remittanceInfo.modeOfPayment.icon)),
                      const SizedBox(
                        width: 50,
                      ),
                      HistoryTextStyle(
                        title: remittanceInfo.modeOfPayment.storeName,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 55,
                  left: 72,
                  child: SizedBox(
                    width: 109,
                    child: Divider(
                      thickness: 5,
                      color: color,
                    ),
                  ),
                ),
                Positioned(
                  top: 55,
                  left: 198,
                  child: SizedBox(
                    width: 102,
                    child: Divider(
                      thickness: 5,
                      color: color,
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 50,
                  //right: 50,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Icon(
                            remittanceInfo.txnStatus > 0
                                ? Icons.check_circle_rounded
                                : Icons.circle_outlined,
                            color: color,
                          ),
                          Text(
                            'Paid',
                            style: smallText,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 160,
                  //right: 50,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Icon(
                            remittanceInfo.txnStatus > 1
                                ? Icons.check_circle_rounded
                                : Icons.circle_outlined,
                            color: color,
                          ),
                          Text('In Transit', style: smallText)
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 50,
                  right: 50,
                  //right: 50,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Icon(
                            remittanceInfo.txnStatus > 2
                                ? Icons.check_circle_rounded
                                : Icons.circle_outlined,
                            color: color,
                          ),
                          Text('Processed', style: smallText)
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
