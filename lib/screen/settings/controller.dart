import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:philmoney/screen/settings/index.dart';

class SettingsController extends GetxController {
  final settingState = SettingsState();

  get state => settingState;

  IconData themeIcon() {
    if (settingState.themeLight.value) {
      return settingState.iconLight;
    }

    return settingState.iconDark;
  }

  void changeAppTheme() {
    settingState.themeLight.value = !settingState.themeLight.value;
    themeIcon();
    print('here ${settingState.themeLight.value}');
  }
  //;////end////////
}
