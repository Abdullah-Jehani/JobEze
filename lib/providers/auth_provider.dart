import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  late bool isAuthenticated;
  String? token;

  setAuthenticated(bool value) {
    Timer(const Duration(milliseconds: 50), () {
      isAuthenticated = value;
      notifyListeners();
    });
  }

  initAuthentication() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    if (kDebugMode) {
      print(" Token Status : $token");
    }
    if (token != null) {
      setAuthenticated(true);
    } else {
      setAuthenticated(false);
    }
  }
}
