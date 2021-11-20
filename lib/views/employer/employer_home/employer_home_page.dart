import 'package:flutter/material.dart';
import 'package:freelance_world_flutter/shared/side_menu.dart';
import 'package:freelance_world_flutter/theme/constants.dart';

class EmployerHomePage extends StatefulWidget {
  EmployerHomePage({Key? key}) : super(key: key);

  @override
  _EmployerHomePageState createState() => _EmployerHomePageState();
}

class _EmployerHomePageState extends State<EmployerHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FreelanceWorld'),
        actions: [],
        backgroundColor: primaryColor,
      ),
      drawer: MenuPage(),
      body: const Text("EMPLOYERHOME"),
    );
  }
}
