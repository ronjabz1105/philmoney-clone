import 'package:flutter/material.dart';

class AppTheme {
  // final _themeLight = true.obs;

  // get themeLight => _themeLight.value;
  // toggleThemeLight() {
  //   _themeLight.value = !_themeLight.value;
  //   print('here $_themeLight');
  // }
  // ThemeData buildDarkTheme() {
  //   return Icons.abc;
  // }
  //  ThemeData buildDarkTheme() {
  //   final ThemeData systemDarkTheme = ThemeData.dark();
  //   return systemDarkTheme.copyWith(
  //       visualDensity: VisualDensity.adaptivePlatformDensity,
  //       iconTheme: getIconTheme(),
  //       textTheme: getTextThemes().apply(
  //           bodyColor: mainTextColorDark, displayColor: mainTextColorDark));
  // }

  ThemeData buildLightTheme = ThemeData(
    primarySwatch: Colors.amber,
    brightness: Brightness.light,
  );

  ThemeData buildDarkTheme = ThemeData(
    primarySwatch: Colors.grey,
    brightness: Brightness.dark,
  );
}
