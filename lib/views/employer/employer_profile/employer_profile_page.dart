import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:freelance_world_flutter/components/offer_card.dart';
import 'package:freelance_world_flutter/components/profile_employer.dart';
import 'package:freelance_world_flutter/models/employer.dart';
import 'package:freelance_world_flutter/models/offer.dart';
import 'package:freelance_world_flutter/services/employer_service.dart';
import 'package:freelance_world_flutter/shared/http_interceptor.dart';
import 'package:freelance_world_flutter/shared/side_menu.dart';
import 'package:freelance_world_flutter/theme/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmployerProfile extends StatefulWidget {
  @override
  _EmployerProfile createState() => _EmployerProfile();
}

class _EmployerProfile extends State<EmployerProfile> {
  late Employer employer;
  Future<Employer> getUserEmployerById() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int employerId = int.parse(prefs.getString('id')!);
    //return getEmployerById(employerId.toString());
    return getEmployerById(employerId.toString());
  }

  @override
  initState() {
    super.initState();
    getUserEmployerById();
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
      body: FutureBuilder<Employer>(
        future: getUserEmployerById(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ProfileEmployer(
                  employer: snapshot.data ?? Employer(),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
