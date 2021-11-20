// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:freelance_world_flutter/shared/side_menu.dart';

var title = 'Fuerza Libre';
var asunt = 'Desarrollador Backend Jr.';

class SendMessagePage extends StatefulWidget {
  @override
  _SendMessagePageState createState() => _SendMessagePageState();
}

class _SendMessagePageState extends State<SendMessagePage> {
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
          // Hide keyboard
          onTap: () {
            FocusScope.of(context).unfocus();
            new TextEditingController().clear();
          },

          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //------------ TITLE
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Enviar a: $title',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Color.fromRGBO(81, 171, 216, 1),
                          ),
                        ),
                      ),
                      //------------ SUBTITLE
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          'Asunto: $asunt',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      //-------------   MESSAGE
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                            maxLines: 15,
                            decoration: InputDecoration(
                                labelText: 'Escriba un mensaje',
                                labelStyle: const TextStyle(
                                    color: Colors.black, fontSize: 15),
                                hintStyle: const TextStyle(fontSize: 20),
                                //fillColor: Colors.lightBlue,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                      ),
                      //--------------  ACCEPT
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: ElevatedButton(
                          child: const Text(
                            'Aceptar',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                barrierDismissible:
                                    false, // N deja salir del alert sin aceptar
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Mensaje Enviado'),
                                    actions: [
                                      ElevatedButton(
                                        child: const Text('Aceptar'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    ],
                                  );
                                });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
