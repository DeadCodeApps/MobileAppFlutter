// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:freelance_world_flutter/models/offer.dart';
import 'package:freelance_world_flutter/models/specialty.dart';
import 'package:freelance_world_flutter/services/employer_service.dart';
import 'package:freelance_world_flutter/shared/http_interceptor.dart';
import 'package:freelance_world_flutter/views/employer/employer_ads/drawer-ad.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';



class FormNewAd extends StatefulWidget {
  FormNewAd({Key? key}): super(key: key);

  @override
  State<FormNewAd> createState() => _FormNewAdState();
}

class _FormNewAdState extends State<FormNewAd> {

  static Future<Offer> createOffer(var offer) async {

    final String postUrl = "https://freelance-world.herokuapp.com/api/";
    var httpClient = AuthenticatedHttpClient();
    
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    final int employerId = int.parse(prefs.getString('id')!);

    String uri2 = "$API_URL/api/employer/$employerId/offers";

    var response = await httpClient.post(
      Uri.parse(uri2),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        // 'title': offer.title,
        // 'description': offer.description,
        // 'paymentAmount': offer.paymentAmount,
        // 'monthDuration': offer.monthDuration,
        // 'startDate': offer.startDate,
        // 'endDate': offer.endDate,
        // 'specialtyId': offer.specialtyId
        'offer': offer
      }),
    );
    print("Aqui 71");

    if (response.statusCode == 200) {
      return Offer.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create freelancer.');
    }
  }

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
  final endDateController = DateRangePickerController();
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
                  SfDateRangePicker(
                    controller: endDateController,
                    view: DateRangePickerView.month,
                    selectionMode: DateRangePickerSelectionMode.single,
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
      "endDate": this.endDateController,///////////////////////////////////////////////me falta aqui
      "specialtyId": int.parse(this.specialtyController.text)
      };


    print(newOffer);
    EmployerService.createOffer(newOffer);
  }

}

class SharedPreferences {
}
