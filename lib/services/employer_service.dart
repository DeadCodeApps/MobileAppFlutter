import 'package:freelance_world_flutter/models/employer.dart';
import 'package:freelance_world_flutter/shared/env.dart';
import 'package:freelance_world_flutter/shared/http_interceptor.dart';

import 'json_service.dart';

Future<Employer> getEmployerById(String employerId) async {
  var httpClient = AuthenticatedHttpClient();
  final response =
      await httpClient.get(Uri.parse("$API_URL/api/employers/$employerId/"));
  if (response.statusCode == 200) {
    return Employer.fromJson(parseToJson(response.bodyBytes));
  } else {
    throw Exception('Failed to load employer');
  }
}
