import 'package:get/get.dart';
import 'package:philmoney/common/controllers.dart/global_controller.dart';
import 'package:philmoney/screen/history/controller.dart';

import 'index.dart';

class RemittanceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RemittanceController>(() => RemittanceController());
    Get.lazyPut<HistoryController>(() => HistoryController());
    Get.lazyPut<GlobalController>(() => GlobalController());
  }
}
