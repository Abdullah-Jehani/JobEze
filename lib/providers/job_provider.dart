import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:job_eze/models/job_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class JobProvider with ChangeNotifier {
  List<JobModel> jobs = [];

  bool isLoading = true;

  setLoading(bool status) {
    Timer(const Duration(milliseconds: 50), () {
      isLoading = status;
      notifyListeners();
    });
  }

  fetchJobs() async {
    setLoading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response = await http.get(
        Uri.parse('https://www.arbeitnow.com/api/job-board-api'),
        headers: {
          "Accept": "Application/json",
          "content-type": "Application/json",
          "Authorization": "Bearer ${prefs.getString("token")}"
        });
    if (response.statusCode == 200) {
      var decodedData = json.decode(response.body)['data'];
      for (var x in decodedData) {
        // List<String> trimmed = decodedData['location'].split(',');
        // String extracted = trimmed[1].trim();
        // decodedData['location'] = extracted;
        jobs.add(JobModel.fromJson(x));
      }
    }
  }
}
