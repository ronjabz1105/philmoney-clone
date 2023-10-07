import 'package:get/get.dart';

import 'index.dart';

class HistoryBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<HistoryController>(() => HistoryController(), fenix: true);
    Get.put<HistoryController>(HistoryController());
    //Get.lazyPut<GlobalController>(() => GlobalController(), fenix: true);
  }
}
