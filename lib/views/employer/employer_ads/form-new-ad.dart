import 'package:flutter/material.dart';
import 'package:freelance_world_flutter/models/offer.dart';
import 'package:freelance_world_flutter/services/employer_service.dart';
import 'package:freelance_world_flutter/views/employer/employer_ads/drawer-ad.dart';



class FormNewAd extends StatefulWidget {
  FormNewAd({Key? key}): super(key: key);

  @override
  State<FormNewAd> createState() => _FormNewAdState();
}

class _FormNewAdState extends State<FormNewAd> {

  // late HttpHelper httpHelper;

  String? puestoBuscadoValue;
  String? tipoPuestoValue;
  String? experienciaLaboralValue;
  String? tituloAnuncioValue;
  String? lugarValue;
  String? sueldoValue;
  String? descripcionValue;

  final puestoBuscadoController = TextEditingController();
  final tipoPuestoController = TextEditingController();
  final experienciaLaboralController = TextEditingController();
  final tituloAnuncioController = TextEditingController();
  final lugarController = TextEditingController();
  final sueldoController = TextEditingController();
  final descriocionController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("FreelanceWorld"),  
        centerTitle: true, 
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,     
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          child: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: ListView(
                children: [
                  Text("Crear nuevo anuncio",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[800],fontSize: 20 ),),
                  Divider(color: Colors.blue[800],),
                  TextFormField(
                    controller: puestoBuscadoController,
                    decoration: InputDecoration(labelText: "Puesto buscado"),
                    onSaved: (value){
                      puestoBuscadoValue = value;
                    },
                  ),
                  TextFormField(
                    controller: tipoPuestoController,
                    decoration: InputDecoration(labelText: "Tipo de puesto"),
                    onSaved: (value){
                      tipoPuestoValue = value;
                    },
                  ),
                  TextFormField(
                  controller: experienciaLaboralController,
                  decoration: InputDecoration(labelText: "Experiencia laboral"),
                  onSaved: (value){
                    experienciaLaboralValue = value;
                  },
                  ),
                  TextFormField(
                  controller: tituloAnuncioController,
                  decoration: InputDecoration(labelText: "Titulo del anuncio"),
                  onSaved: (value){
                    tituloAnuncioValue = value;
                  },
                  ),
                  TextFormField(
                  controller: lugarController,
                  decoration: InputDecoration(labelText: "Lugar"),
                  onSaved: (value){
                    lugarValue = value;
                  },
                  ),
                  TextFormField(
                  controller: sueldoController,
                  decoration: InputDecoration(labelText: "Sueldo"),
                  onSaved: (value){
                    sueldoValue = value;
                    },
                  ),
                  TextFormField(
                  controller: descriocionController,
                  decoration: InputDecoration(labelText: "Descripcion"),
                  onSaved: (value){
                    descripcionValue = value;
                    },
                  ),
                  ElevatedButton(
                    child: Text("Crear"),
                    onPressed: (){
                     
                    },
                    )
                ]
              ),
            ),
          ),
        )
      ),
      // drawer: Drawer(
      //   child: DrawerAnuncios()
      // ),
    );
  }

  // void createOffer(){
  //   final newOffer = new Offer(
  //     title: this.tituloAnuncioValue, 
  //     description: this.descripcionValue, 
  //     paymentAmount: paymentAmount, 
  //     monthDuration: monthDuration, 
  //     specialty: specialty)
  //   httpHelper.createoffer(offer)
  // }
}
