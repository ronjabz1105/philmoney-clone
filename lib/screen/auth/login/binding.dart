import 'package:get/get.dart';
import 'package:philmoney/screen/auth/login/controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
