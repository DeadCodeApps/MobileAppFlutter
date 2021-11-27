import 'dart:js';

import 'package:flutter/material.dart';
import 'package:freelance_world_flutter/components/profile_freelancer.dart';
import 'package:freelance_world_flutter/views/auth/welcome/welcome_page.dart';
import 'package:freelance_world_flutter/views/freelancer/freelancer_home/freelancer_home_page.dart';
import 'package:freelance_world_flutter/views/freelancer/freelancer_postulations/my_postulations.dart';
import 'package:freelance_world_flutter/views/freelancer/freelancer_profile/freelancer_profile_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const WelcomePage(),
    '/home': (BuildContext context) => FreelancerHomePage(),
    '/my_postulations': (context) => MyPostulationPage(),
    '/profile': (context) => FreelancerProfile(),
  };
}
