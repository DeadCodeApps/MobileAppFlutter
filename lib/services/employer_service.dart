import 'dart:convert';

import 'package:freelance_world_flutter/models/employer.dart';
import 'package:freelance_world_flutter/models/offer.dart';
import 'package:freelance_world_flutter/shared/env.dart';
import 'package:freelance_world_flutter/shared/http_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

class EmployerService {
  Future<List> fetchOffers() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String employerId =  prefs.getString('id') ?? '';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int employerId = int.parse(prefs.getString('id')!);

    print("$API_URL/api/employers/$employerId/offers");
    var httpClient = AuthenticatedHttpClient();

    final response = await httpClient
        .get(Uri.parse("$API_URL/api/employers/$employerId/offers"));

    // http.Response response = await http.get(url);
    // print(response.body);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      List offers = jsonResponse.map((map) => Offer.fromJson(map)).toList();
      // print(jsonResponse);
      return offers;
    }
    return [];
  }

  static Future<Offer> createOffer(var offer) async {
    var httpClient = AuthenticatedHttpClient();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int employerId = int.parse(prefs.getString('id')!);

    String uri2 = "$API_URL/api/employer/$employerId/offers";

    var response = await httpClient.post(
      Uri.parse(uri2),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        // 'title': offer.title,
        // 'description': offer.description,
        // 'paymentAmount': offer.paymentAmount,
        // 'monthDuration': offer.monthDuration,
        // 'startDate': offer.startDate,
        // 'endDate': offer.endDate,
        // 'specialtyId': offer.specialtyId
        'offer': offer
      }),
    );
    print("Aqui 71");

    if (response.statusCode == 200) {
      return Offer.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create freelancer.');
    }
  }
}
