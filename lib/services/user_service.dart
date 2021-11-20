import 'dart:convert';

import 'package:freelance_world_flutter/shared/env.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<String> getUsertype(String userId) async {
  final userTypeResponse =
      await http.get(Uri.parse("$API_URL/api/user/$userId"));
  Map<String, dynamic> mapUserType = json.decode(userTypeResponse.body);
  String accountType = mapUserType["accountType"];
  return accountType;
}

Future<String?> getUserId() async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  String? userId = sharedPref.getString("id");
  return userId;
}

Future<String?> getUserFullName() async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  String? userFullname = sharedPref.getString("fullname");
  return userFullname;
}

Future<String?> getUserEmail() async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  String? email = sharedPref.getString("email");
  return email;
}
