import 'package:get/get.dart';
import 'package:philmoney/common/controllers.dart/global_controller.dart';

import 'index.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<GlobalController>(() => GlobalController());
  }
}
