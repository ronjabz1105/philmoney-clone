import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:philmoney/common/Theme/colors.dart';
import 'package:philmoney/common/models/remittanceModel.dart';

import '../index.dart';

class PaymentBarcode extends GetView<HistoryController> {
  PaymentBarcode({Key? key, required this.remittance}) : super(key: key);
  RemittanceModel remittance;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        SizedBox(
          height: 260,
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 70,
                width: 290,
                child: BarcodeWidget(
                  data: remittance.modeOfPayment.barcode1,
                  barcode: Barcode.telepen(),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 70,
                width: 330,
                child: BarcodeWidget(
                  data: remittance.modeOfPayment.barcode2,
                  barcode: Barcode.telepen(),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 70,
                width: 310,
                child: BarcodeWidget(
                  data: remittance.modeOfPayment.barcode3,
                  barcode: Barcode.telepen(),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 300,
          width: double.maxFinite,
          child: remittance.status == 'expired' || remittance.txnStatus == 3
              ? Image(
                  image: remittance.status == 'expired'
                      ? AssetImage(controller.historyState.removeIcon)
                      : AssetImage(controller.historyState.checkIcon),
                  color: remittance.status == 'expired'
                      ? AppColors.warningText.withOpacity(0.6)
                      : AppColors.primaryElementStatus.withOpacity(0.6),
                )
              : Container(),
        ),
      ],
    );
  }
}
