import 'dart:convert';

class JobModel {
  String companyName;
  String title;
  String description;
  bool remote;
  String location;

  JobModel({
    required this.companyName,
    required this.title,
    required this.description,
    required this.remote,
    required this.location,
  });

  factory JobModel.fromRawJson(String str) =>
      JobModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
        companyName: json["company_name"],
        title: json["title"],
        description: json["description"],
        remote: json["remote"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "company_name": companyName,
        "title": title,
        "description": description,
        "remote": remote,
        "location": location,
      };
}
