import 'package:get/get.dart';

import 'index.dart';

class CouponBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CouponController>(() => CouponController());
  }
}
