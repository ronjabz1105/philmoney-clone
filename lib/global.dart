import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:philmoney/firebase_options.dart';
import 'package:philmoney/screen/welcome/controller.dart';
import 'package:get/get.dart';

class Global {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    Get.put<WelcomeController>(WelcomeController());
    //Get.put<ThemeController>(ThemeController());
  }
}
