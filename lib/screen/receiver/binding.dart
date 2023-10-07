import 'package:get/get.dart';
import 'package:philmoney/screen/remittance/controller.dart';

import 'index.dart';

class ReceiverBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReceiverController>(() => ReceiverController());
    Get.lazyPut<RemittanceController>(() => RemittanceController());
  }
}
