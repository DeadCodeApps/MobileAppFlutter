// ignore_for_file: prefer_const_constructors

import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:freelance_world_flutter/shared/side_menu.dart';
import 'package:freelance_world_flutter/views/freelancer/send_message/send_message_page.dart';

var location = 'San Borja, Lima';
var title = 'Desarrollador backend C#';
var status = 'Pendiente';
var type = 'Full time';
var published = '9 diciembre de 2020';

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
        title: Image.asset(
          "assets/logo.png",
          height: 100.0,
          width: 50.0,
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      drawer: MenuPage(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          TextEditingController().clear();
        },
        child: ListView(
          children: [
            const SizedBox(width: 30),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                        offset: Offset(0, 5))
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
                    //  SEARCH
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextField(
                        maxLines: 1,
                        decoration: InputDecoration(
                          labelText: 'Puesto, empresa o palabra clave',
                          hintStyle: const TextStyle(fontSize: 10),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          icon: const Icon(Icons.search),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Buscar'),
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
                          "$location",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                        Text("$title",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Color.fromRGBO(81, 171, 216, 1),
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SendMessagePage()));
                            },
                            icon: Icon(Icons.message)),
                        Text("$status",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[500],
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("$type",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            )),
                        Text("$published",
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
    );
  }
}
