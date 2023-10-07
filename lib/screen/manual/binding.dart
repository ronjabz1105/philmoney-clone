import 'package:get/get.dart';

import 'index.dart';

class ManualBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManualController>(() => ManualController());
  }
}
