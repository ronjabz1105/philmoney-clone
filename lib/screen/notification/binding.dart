import 'package:get/get.dart';

import 'index.dart';

class NotificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationController>(() => NotificationController());
  }
}
