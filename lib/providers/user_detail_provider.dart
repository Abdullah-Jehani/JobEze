import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:job_eze/models/user_detail_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDetailProvider with ChangeNotifier {
  bool isLoading = true;
  UserDetailModel? currentUser;

  setloading(bool status) {
    Timer(const Duration(milliseconds: 300), () {
      isLoading = status;
      notifyListeners();
    });
  }

  fetchUserDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final response =
        await http.get(Uri.parse('https://randomuser.me/api/'), headers: {
      "Accept": "Application/json",
      "content-type": "Application/json",
      "Authorization": "Bearer ${prefs.getString("token")}"
    });
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print('STATUS CODE : SUCCESS ');
      }
      setloading(false);
      currentUser =
          UserDetailModel.fromJson(jsonDecode(response.body)['results']);
      if (kDebugMode) {
        print("currentUser $currentUser");
      }
    } else {
      if (kDebugMode) {
        print('STATUS CODE : FAILED ');
      }
    }
  }
}
