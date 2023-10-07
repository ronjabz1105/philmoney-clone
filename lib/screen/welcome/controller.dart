import 'package:get/get.dart';
import 'package:philmoney/common/routes/names.dart';

class WelcomeController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    Future.delayed(
        const Duration(seconds: 2), () => Get.offAllNamed(AppRoutes.LOGIN));
    super.onReady();
  }
}
