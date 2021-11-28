// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:freelance_world_flutter/views/auth/welcome/welcome_page.dart';
import 'package:freelance_world_flutter/views/employer/employer_home/employer_home_page.dart';
import 'package:freelance_world_flutter/views/freelancer/freelancer_home/freelancer_home_page.dart';
import 'package:freelance_world_flutter/views/freelancer/freelancer_postulations/my_postulations.dart';
import 'package:freelance_world_flutter/views/freelancer/freelancer_profile/freelancer_profile_page.dart';

import 'views/employer/employer_profile/employer_profile_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const WelcomePage(),
    '/home': (BuildContext context) => FreelancerHomePage(),
    '/home_employer': (BuildContext context) => EmployerHomePage(),
    '/my_postulations': (context) => MyPostulationPage(),
    '/profile_freelancer': (context) => FreelancerProfile(),
    '/profile_employer': (context) => EmployerProfile(),
  };
}
