import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:freelance_world_flutter/components/offer_card.dart';
import 'package:freelance_world_flutter/components/profile_freelancer.dart';
import 'package:freelance_world_flutter/models/freelancer.dart';
import 'package:freelance_world_flutter/models/offer.dart';
import 'package:freelance_world_flutter/shared/http_interceptor.dart';
import 'package:freelance_world_flutter/shared/side_menu.dart';
import 'package:freelance_world_flutter/theme/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FreelancerProfile extends StatefulWidget {
  @override
  _FreelancerProfile createState() => _FreelancerProfile();
}

class _FreelancerProfile extends State<FreelancerProfile> {
  late Freelancer freelancer;

  Freelancer parseFreelancer(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Freelancer>((json) => Freelancer.fromJson(json)).toList();
  }

  Future<Freelancer> getFreelancerById() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int freelancerId = int.parse(prefs.getString('id')!);
    var httpClient = AuthenticatedHttpClient();
    final response = await httpClient.get(
      Uri.parse(
          "https://freelance-world.herokuapp.com/api/freelancer/$freelancerId"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return parseFreelancer(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load freelancer');
    }
  }

  @override
  initState() {
    super.initState();
    getFreelancerById();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FreelanceWorld'),
        actions: [],
        backgroundColor: primaryColor,
      ),
      drawer: MenuPage(),
      body: FutureBuilder<Freelancer>(
        future: getFreelancerById(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return ProfileFreelancer(freelancer: freelancer);
        },
      ),
    );
  }
}
