import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:philmoney/common/routes/names.dart';
import 'package:philmoney/common/routes/pages.dart';
import 'package:philmoney/global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: AppRoutes.INITIAL,
      getPages: AppPages.routes,
      builder: EasyLoading.init(),
      // theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
    );
  }
}

















// theme: Get.find<ThemeController>().ligthTheme,
      //DarkTheme().buildDarkTheme(),
      // AppTheme().themeLight
      // ? AppTheme().buildLightTheme
      // : AppTheme().buildDarkTheme,
      // theme: ThemeData(
      //     //primarySwatch: Colors.green,
      //     ),
