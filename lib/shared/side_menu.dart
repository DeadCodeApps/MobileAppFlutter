import 'package:flutter/material.dart';
import 'package:freelance_world_flutter/models/freelancer.dart';
import 'package:freelance_world_flutter/models/user.dart';
import 'package:freelance_world_flutter/services/freelancer_service.dart';
import 'package:freelance_world_flutter/services/user_service.dart';
import 'package:freelance_world_flutter/theme/constants.dart';

import 'http_interceptor.dart';

//Vars
String image_profile = "assets/freelancer.png";

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String? email;
  String? fullname;
  String? userId;
  String? userType;

  Future<bool> getUserData() async {
    email = await getUserEmail();
    fullname = await getUserFullName();
    userId = await getUserId();
    userType = await getUsertype(userId!);
    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUserData(),
        builder: (context, snapshot) {
          return SideMenu(
              email: email ?? '',
              fullname: fullname ?? '',
              userId: userId ?? '',
              userType: userType ?? '');
        });
  }
}

class SideMenu extends StatelessWidget {
  final String email;
  final String fullname;
  final String userId;
  final String userType;

  const SideMenu({
    Key? key,
    required this.email,
    required this.fullname,
    required this.userId,
    required this.userType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: primaryColor,
            ),
            accountName: Text(fullname),
            accountEmail: Text(email),
            currentAccountPicture: Image.asset(image_profile),
          ),
          ListTile(
            title: Text('Inicio'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/home');
              //
            },
          ),
          ListTile(
            title: Text('Postular'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/home');
              //
            },
          ),
          ListTile(
            title: Text('Mis Postulaciones'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/my_postulations');
              //
            },
          ),
          ListTile(
            title: Text('Mi Cuenta'),
            onTap: () {
              if (userType == "FREELANCER") {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/profile_freelancer');
              } else if (userType == "EMPLOYER") {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/profile_employer');
              }
              //
            },
          ),
          ListTile(
            title: Text('Cerrar sesión'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '');
              //
            },
          ),
        ],
      ),
    );
  }
}
