import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:freelance_world_flutter/components/offer_card.dart';
import 'package:freelance_world_flutter/components/profile_freelancer.dart';
import 'package:freelance_world_flutter/models/freelancer.dart';
import 'package:freelance_world_flutter/models/offer.dart';
import 'package:freelance_world_flutter/services/freelancer_service.dart';
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
  Future<Freelancer> getUserFreelancerById() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int freelancerId = int.parse(prefs.getString('id')!);
    return getFreelancerById(freelancerId.toString());
  }

  @override
  initState() {
    super.initState();
    getUserFreelancerById();
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
        future: getUserFreelancerById(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ProfileFreelancer(
                  freelancer: snapshot.data ?? Freelancer(),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
