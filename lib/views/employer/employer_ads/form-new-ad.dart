// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:freelance_world_flutter/models/offer.dart';
import 'package:freelance_world_flutter/models/specialty.dart';
import 'package:freelance_world_flutter/services/employer_service.dart';
import 'package:freelance_world_flutter/views/employer/employer_ads/drawer-ad.dart';



class FormNewAd extends StatefulWidget {
  FormNewAd({Key? key}): super(key: key);

  @override
  State<FormNewAd> createState() => _FormNewAdState();
}

class _FormNewAdState extends State<FormNewAd> {


  // String titleOfferValue = '';
  // String descriptionOfferValue = '';
  // double paymentAmountValue = 0;
  // int monthDurationValue = 0;
  // String startDateValue = '';
  // String endDateValue = '';
  // int specialty = 0;

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final paymentController = TextEditingController();
  final monthDController = TextEditingController();
  // final startDate = TextEditingController();
  final endDateController = TextEditingController();
  final specialtyController = TextEditingController();

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
                    controller: titleController,
                    decoration: InputDecoration(labelText: "Titulo"),
                    onSaved: (value){
                      // titleOfferValue = value!;
                    },
                  ),
                  TextFormField(
                    controller: descriptionController,
                    decoration: InputDecoration(labelText: "Descripcion"),
                    onSaved: (value){
                      // descriptionOfferValue = value!;
                    },
                  ),
                  TextFormField(
                  controller: paymentController,
                  decoration: InputDecoration(labelText: "Monto de pago"),
                  onSaved: (value){
                    // paymentAmountValue = double.parse(value!);
                  },
                  ),
                  TextFormField(
                  controller: monthDController,
                  decoration: InputDecoration(labelText: "Meses de duración"),
                  onSaved: (value){
                    // monthDurationValue = int.parse(value!);
                  },
                  ),
                  TextFormField(
                  controller: endDateController,
                  decoration: InputDecoration(labelText: "Fecha de termino"),
                  onSaved: (value){
                    // endDateValue = value!;
                  },
                  ),
                  TextFormField(
                  controller: specialtyController,
                  decoration: InputDecoration(labelText: "Especialidad"),
                  onSaved: (value){
                    // specialty = int.parse(value!);
                    },
                  ),
                  ElevatedButton(
                    child: Text("Crear"),
                    onPressed: (){
                     createOffer();
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

  void createOffer(){
    final newOffer = {
      "title": this.titleController.text,
      "description": this.descriptionController.text,
      "paymentAmount": double.parse(this.paymentController.text),
      "monthDuration": int.parse(this.monthDController.text),
      "startDate": DateTime.now(),
      "endDate": DateTime.now(),///////////////////////////////////////////////me falta aqui
      "specialtyId": int.parse(this.specialtyController.text)
      };


    print(newOffer);
    EmployerService.createOffer(newOffer);
  }

}
