import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freelance_world_flutter/models/offer.dart';
import 'package:freelance_world_flutter/services/employer_service.dart';
import 'package:freelance_world_flutter/views/employer/employer_ads/ads.dart';
import 'package:freelance_world_flutter/views/employer/employer_ads/drawer-ad.dart';
import 'package:http/http.dart' as http;



class FormNewAd extends StatefulWidget {
  FormNewAd({Key? key}): super(key: key);

  @override
  State<FormNewAd> createState() => _FormNewAdState();
}

class _FormNewAdState extends State<FormNewAd> {

  // late HttpHelper httpHelper;

  // String? puestoBuscadoValue;
  // String? tipoPuestoValue;
  // String? experienciaLaboralValue;
  // String? tituloAnuncioValue;
  // String? lugarValue;
  // String? sueldoValue;
  // String? descripcionValue;

  // final puestoBuscadoController = TextEditingController();
  // final tipoPuestoController = TextEditingController();
  // final experienciaLaboralController = TextEditingController();
  // final tituloAnuncioController = TextEditingController();
  // final lugarController = TextEditingController();
  // final sueldoController = TextEditingController();
  // final descriocionController = TextEditingController();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final paymentAmountController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final monthDurationController = TextEditingController();
  final specialtyController = TextEditingController();



  Future<Offer> postOffer(Offer offer) async {
    final response = await http.post(
      Uri.parse('https://freelance-world.herokuapp.com/api/freelancers'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'title': offer.title,
        'description': offer.description,
        'paymentAmount': offer.paymentAmount,
        'startDate': offer.startDate,
        'endDate': offer.endDate,
        'monthDuration': offer.monthDuration,
        'specialty': offer.specialty
      }),
    );

    if (response.statusCode == 200) {
      return Offer.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create freelancer.');
    }
  }

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
                    controller: this.titleController,
                    decoration: InputDecoration(labelText: "Titulo"),
                    onSaved: (value){
                      // puestoBuscadoValue = value;
                    },
                  ),
                  TextFormField(
                    controller: this.descriptionController,
                    decoration: InputDecoration(labelText: "Descripcion"),
                    onSaved: (value){
                      // tipoPuestoValue = value;
                    },
                  ),
                  TextFormField(
                  controller: this.paymentAmountController,
                  decoration: InputDecoration(labelText: "Monto de pago"),
                  onSaved: (value){
                    // experienciaLaboralValue = value;
                  },
                  ),
                  TextFormField(
                  controller: this.endDateController,
                  decoration: InputDecoration(labelText: "Fecha de finalizacion"),
                  onSaved: (value){
                    // tituloAnuncioValue = value;
                  },
                  ),
                  TextFormField(
                  controller: this.monthDurationController,
                  decoration: InputDecoration(labelText: "Meses de duración"),
                  onSaved: (value){
                    // lugarValue = value;
                  },
                  ),
                  TextFormField(
                  controller: this.specialtyController,
                  decoration: InputDecoration(labelText: "Especialidad (id)"),
                  onSaved: (value){
                    // sueldoValue = value;
                    },
                  ),
                  
                  ElevatedButton(
                    child: Text("Crear"),
                    onPressed: (){
                      Offer offer = Offer(
                      title: this.titleController.text,
                      description: this.titleController.text,
                      paymentAmount: double.parse(this.paymentAmountController.text),
                      startDate: DateTime.now());
                  postOffer(offer);
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return const Ads();
                  // }));
                     
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
