import 'package:flutter/material.dart';
import 'package:freelance_world_flutter/views/auth/welcome/welcome_page.dart';
import 'package:freelance_world_flutter/views/freelancer/freelancer_home/freelancer_home_page.dart';
import 'package:freelance_world_flutter/views/freelancer/freelancer_postulations/my_postulations.dart';
import 'package:freelance_world_flutter/views/freelancer/send_message/send_message_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const WelcomePage(),
    '/home': (BuildContext context) => FreelancerHomePage(),
    '/send_message': (context) => SendMessagePage(),
    '/my_postulations': (context) => MyPostulationPage(),
  };
}
