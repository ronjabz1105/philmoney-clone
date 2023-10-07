import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:philmoney/common/routes/names.dart';

class HomeController extends GetxController {
  final activePage = 0.obs;

  //timer
  Timer? _timer;
  int remainSeconds = 1;
  final time = '00.00'.obs;

  @override
  void onReady() {
    // TODO: implement onReady
    pageViewAnimation();
    super.onReady();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  void pageViewAnimation() {
    const duration = Duration(seconds: 5);
    // = seconds;

    _timer = Timer.periodic(duration, (Timer timer) {
      if (activePage.value == 0) {
        activePage.value = 1;
      } else if (activePage.value == 1) {
        activePage.value = 2;
      } else if (activePage.value == 2) {
        activePage.value = 0;
      }

      if (kDebugMode) {
        print(' active page is ${activePage.value} ');
      }
    });
  }

  void goToNewPage(String page) {
    print('goin to $page ');

    if (page == AppRoutes.REMITTANCE) {
      //dispose();
    }
    Get.toNamed(page);

    // if (page == AppRoutes.RECEIVER) {
    //   Get.toNamed(page);
    // } else if (page == AppRoutes.REMITTANCE) {
    //   dispose();
    //   Get.offAllNamed(page);
    // }else{
    //     print('noting to go $page ');
    // }
  }

  //;////end////////
}
