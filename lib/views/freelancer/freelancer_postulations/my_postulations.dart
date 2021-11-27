// ignore_for_file: prefer_const_constructors

import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:freelance_world_flutter/shared/side_menu.dart';
import 'package:freelance_world_flutter/views/freelancer/send_message/send_message_page.dart';
import 'package:freelance_world_flutter/theme/constants.dart';

var status_0 = 'Rechazado';
var status_1 = 'Pendiente';
var type_0 = 'Part-Time';
var type_1 = 'Full-Time';

var company_1 = "W.W. Technology";
var location_1 = 'San Borja, Lima';
var title_1 = 'Desarrollador BackEnd';
var amount_1 = '2500';

var company_2 = "Polar Inc.";
var location_2 = 'Miraflores, Lima';
var title_2 = 'Desarrollador FrontEnd Vue';
var amount_2 = '2000';

var company_3 = "Alpha Technology";
var location_3 = 'La Molina, Lima';
var title_3 = 'Desarrollador FullStack';
var amount_3 = '5500';

class MyPostulationPage extends StatefulWidget {
  @override
  _MyPostulationPageState createState() => _MyPostulationPageState();
}

class _MyPostulationPageState extends State<MyPostulationPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FreelanceWorld'),
        actions: [],
        backgroundColor: primaryColor,
      ),
      drawer: MenuPage(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          TextEditingController().clear();
        },
        child: ListView(children: [
          const SizedBox(width: 30),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 10, offset: Offset(0, 5))
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //  TITLE
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Mis postulaciones',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Color.fromRGBO(81, 171, 216, 1)),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10,
                              offset: Offset(0, 5))
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "$location_1",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                              Text("$title_1",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Color.fromRGBO(81, 171, 216, 1),
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("$company_1",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey[500],
                                  )),
                              Row(
                                children: [
                                  IconButton(
                                      color: Colors.blue,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SendMessagePage(
                                                        company_1, title_1)));
                                      },
                                      icon: Icon(Icons.message)),
                                  Text("$status_1",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green[500],
                                      )),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("$type_1",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  )),
                              Text("S/." + "$amount_1",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10,
                              offset: Offset(0, 5))
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "$location_2",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                              Text("$title_2",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Color.fromRGBO(81, 171, 216, 1),
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("$company_2",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey[500],
                                  )),
                              Row(
                                children: [
                                  IconButton(
                                      color: Colors.black,
                                      onPressed: () {},
                                      icon: Icon(Icons.message)),
                                  Text("$status_0",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red[500],
                                      )),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("$type_0",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  )),
                              Text("S/." + "$amount_2",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10,
                              offset: Offset(0, 5))
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "$location_3",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                              Text("$title_3",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Color.fromRGBO(81, 171, 216, 1),
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("$company_3",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey[500],
                                  )),
                              Row(
                                children: [
                                  IconButton(
                                      color: Colors.blue,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SendMessagePage(
                                                        company_3, title_3)));
                                      },
                                      icon: Icon(Icons.message)),
                                  Text("$status_1",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green[500],
                                      )),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("$type_1",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  )),
                              Text("S/." + "$amount_3",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
