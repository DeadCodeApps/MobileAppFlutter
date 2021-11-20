import 'dart:convert';

import 'package:diacritic/diacritic.dart';
import 'package:freelance_world_flutter/models/freelancer.dart';
import 'package:freelance_world_flutter/services/json_service.dart';
import 'package:freelance_world_flutter/shared/env.dart';
import 'package:freelance_world_flutter/shared/http_interceptor.dart';

Future<Freelancer> getFreelancerById(String freelancerId) async {
  var httpClient = AuthenticatedHttpClient();
  final response =
      await httpClient.get(Uri.parse("$API_URL/api/freelancers/$freelancerId"));
  if (response.statusCode == 200) {
    return Freelancer.fromJson(parseToJson(response.bodyBytes));
  } else {
    throw Exception('Failed to load freelancer');
  }
}
