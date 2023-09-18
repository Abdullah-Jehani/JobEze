import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  bool currentTheme = false;
  ThemeMode get themeMode {
    if (currentTheme == true) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }

  changeTheme(bool theme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('theme', theme);
    currentTheme = theme;
    notifyListeners();
  }

  initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    currentTheme = prefs.getBool('theme') ?? false;
    notifyListeners();
  }
}
