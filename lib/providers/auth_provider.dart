import 'dart:async';
import 'package:flutter/material.dart';
import 'package:job_eze/services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'dart:async' show Future, Timer;
import 'dart:convert';
import 'package:job_eze/models/user_model.dart';

class AuthProvider with ChangeNotifier {
  String test = 'Test';
  Api api = Api();
  bool? isAuthenticated;
  String? token;
  bool isFirstTime = false;
  bool? isLoaading;
  UserModel? userModel;

  setLoading(bool value) {
    Timer(const Duration(milliseconds: 5), () {
      isLoaading = value;
      notifyListeners();
    });
  }

  setAuthenticated(bool value) {
    Timer(const Duration(milliseconds: 50), () {
      isAuthenticated = value;
      notifyListeners();
    });
  }

  Future<void> checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isFirstTime = prefs.getBool('isFirstTime') ?? true;
    notifyListeners();
  }

  Future<void> setFirstTime(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFirstTime', value);
    isFirstTime = value;
    notifyListeners();
  }

  initAuthentication() async {
    setLoading(true);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    if (kDebugMode) {
      print(" Token Status : $token");
      print(" isFirstTime ? : $isFirstTime");
    }
    if (token != null) {
      setAuthenticated(true);
      setLoading(false);
    } else {
      setAuthenticated(false);
      setLoading(false);
    }
    setLoading(false);
  }

  Future<List> login(Map userBody, BuildContext context) async {
    setLoading(true);
    final response = await api.post(
        "https://api.ha-k.ly/api/v1/client/auth/login", userBody);

    if (response.statusCode == 201) {
      setAuthenticated(true);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var decodedToken = json.decode(response.body)['token'];
      prefs.setString("token", decodedToken);
      if (kDebugMode) {
        print(" Response Status${response.statusCode}");
        print(" isFirstTime ? : $isFirstTime");
        print(" Token Status : $token");
        print(" Token : $decodedToken");
      }
      if (kDebugMode) {
        print(" Response Body ${response.body}");
        print(" isFirstTime ? : $isFirstTime");
      }
      return [true, ''];
    } else {
      setAuthenticated(false);
      if (kDebugMode) {
        print(" Response Status${response.statusCode}");
      }
      if (kDebugMode) {
        print(" Response Body ${response.body}");
      }
      setLoading(false);
      return [false, json.decode(response.body)['message']];
    }
  }

  getUser() async {
    final response = await api.get('https://api.ha-k.ly/api/v1/client/auth/me');
    if (response.statusCode == 200) {
      userModel = UserModel.fromJson(jsonDecode(response.body)['data']);
      setLoading(false);
    }
  }

  Future<List> register(Map userBody, BuildContext context) async {
    setLoading(true);
    final response = await api.post(
        "https://api.ha-k.ly/api/v1/client/auth/register", userBody);

    if (response.statusCode == 201) {
      setAuthenticated(true);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var decodedToken = json.decode(response.body)['token'];
      prefs.setString("token", decodedToken);
      if (kDebugMode) {
        print(" Response Status : ${response.statusCode}");
      }
      if (kDebugMode) {
        print(" Response Body {$userBody}");
      }
      return [true, ''];
    } else {
      setAuthenticated(false);
      if (kDebugMode) {
        print(" Response Status : ${response.statusCode}");
      }
      if (kDebugMode) {
        print(" Response Body {$userBody}");
      }
      setLoading(false);
      return [false, json.decode(response.body)['message']];
    }
  }

  Future<bool> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    setFirstTime(false);
    return true;
  }

//   Future<void> clearCache() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.clear();
//     isFirstTime = null;
//     notifyListeners();
//     if (kDebugMode) {
//       print("first Time $isFirstTime");
//     }
//   }
// }
}
