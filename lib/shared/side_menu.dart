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

  Future<bool> getUserData() async {
    email = await getUserEmail();
    fullname = await getUserFullName();
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
          return SideMenu(email: email ?? '', fullname: fullname ?? '');
        });
  }
}

class SideMenu extends StatelessWidget {
  final String email;
  final String fullname;

  const SideMenu({
    Key? key,
    required this.email,
    required this.fullname,
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
              Navigator.pushNamed(context, '');
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
            title: Text('Mis Anuncios'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/my_ads');
              //
            },
          ),
          ListTile(
            title: Text('Entrevistas'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/interviews_postulant');
              //
            },
          ),
          ListTile(
            title: Text('Mi Cuenta'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '');
              //
            },
          ),
          ListTile(
            title: Text('Configuracion'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '');
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
