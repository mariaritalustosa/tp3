import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  bool isDarkMode = false;

  ThemeMode get themeMode => isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void toogleTheme(){
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}