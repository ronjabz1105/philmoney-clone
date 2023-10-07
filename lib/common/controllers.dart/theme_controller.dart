import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:philmoney/common/Theme/app_dark_theme.dart';
import 'package:philmoney/common/Theme/app_light_theme.dart';

class ThemeController extends GetxController {
  late ThemeData _darkTheme;
  late ThemeData _lightTheme;

  @override
  void onInit() {
    initializedThemeData();
    super.onInit();
  }

  initializedThemeData() {
    _darkTheme = DarkTheme().buildDarkTheme();
    _lightTheme = LightTheme().buildLightTheme();
  }

  ThemeData get darkTheme => _darkTheme;
  ThemeData get ligthTheme => _lightTheme;
}
