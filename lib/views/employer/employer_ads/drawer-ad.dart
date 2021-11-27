import 'package:flutter/material.dart';

class DrawerAnuncios extends StatelessWidget {
  const DrawerAnuncios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
          width: double.infinity,
          child: Container(
            padding: EdgeInsets.only(top: 15),
            color: Colors.blue[900],
            width: double.infinity,
            child: Column(
              children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Menu", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[50])),
                ]
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                CircleAvatar(
                  backgroundImage: NetworkImage("https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG.png"),
                ),
                Text("Bienvenido(a) Cesar", style: TextStyle(color: Colors.grey[50], fontWeight: FontWeight.bold, fontSize: 18))
                ],
              ),
              Divider(color: Colors.grey[50]),
              Text("Inicio", style: TextStyle(color: Colors.grey[50], fontSize: 15)),
              Divider(color: Colors.grey[50]),
              Text("Publicar anuncio", style: TextStyle(color: Colors.grey[50], fontSize: 15)),
              Divider(color: Colors.grey[50]),
              Text("Mis anuncios", style: TextStyle(color: Colors.grey[50], fontSize: 15)),
              Divider(color: Colors.grey[50]),
              Text("Entrevistas", style: TextStyle(color: Colors.grey[50], fontSize: 15)),
              Divider(color: Colors.grey[50]),
              Text("Mi cuenta", style: TextStyle(color: Colors.grey[50], fontSize: 15)),
              Divider(color: Colors.grey[50]),
              Text("Configuración", style: TextStyle(color: Colors.grey[50], fontSize: 15)),
              Divider(color: Colors.grey[50]),
              Text("Cerrar sesión", style: TextStyle(color: Colors.grey[50], fontSize: 15)),
            ],)
          )
        ),
    );
  }
}
