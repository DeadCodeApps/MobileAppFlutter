import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:freelance_world_flutter/models/offer_post.dart';
import 'package:freelance_world_flutter/shared/http_interceptor.dart';
import 'package:freelance_world_flutter/shared/side_menu.dart';
import 'package:freelance_world_flutter/theme/constants.dart';
import 'package:freelance_world_flutter/views/employer/employer_home/employer_home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class NewOffer extends StatefulWidget {
  const NewOffer({Key? key}) : super(key: key);

  @override
  State<NewOffer> createState() => _NewOfferAdState();
}

class _NewOfferAdState extends State<NewOffer> {
  late DateTime? startDate;
  late DateTime? lastDate;
  int specialtyId = 1;

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final paymentAmountController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final monthDurationController = TextEditingController();

  Future<OfferPost> postOffer(OfferPost offer) async {
    var httpClient = AuthenticatedHttpClient();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int employerId = int.parse(prefs.getString('id')!);
    final response = await httpClient.post(
      Uri.parse(
          'https://freelance-world.herokuapp.com/api/employers/$employerId/offers'),
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
        'specialtyId': specialtyId
      }),
    );

    if (response.statusCode == 200) {
      print("se grabó");
      return OfferPost.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create offer.');
    }
  }

  final formkey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FreelanceWorld'),
        actions: [],
        backgroundColor: primaryColor,
      ),
      drawer: MenuPage(),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            child: Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: ListView(children: [
                  Text(
                    "Crear nuevo oferta de trabajo",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800],
                        fontSize: 20),
                  ),
                  Divider(
                    color: Colors.blue[800],
                  ),
                  TextFormField(
                    controller: titleController,
                    decoration:
                        const InputDecoration(labelText: "Titulo de la oferta"),
                    onSaved: (value) {
                      // puestoBuscadoValue = value;
                    },
                  ),
                  TextFormField(
                    controller: descriptionController,
                    decoration: const InputDecoration(labelText: "Descripción"),
                    onSaved: (value) {
                      // tipoPuestoValue = value;
                    },
                  ),
                  TextFormField(
                    controller: paymentAmountController,
                    decoration: const InputDecoration(labelText: "Sueldo"),
                    onSaved: (value) {
                      // experienciaLaboralValue = value;
                    },
                  ),
                  TextFormField(
                      controller: startDateController,
                      decoration:
                          const InputDecoration(labelText: "Fecha de inicio"),
                      onTap: () async {
                        startDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2025));
                        if (startDate != null) {
                          String formattedDate =
                              DateFormat('dd-MM-yyyy').format(startDate!);
                          setState(() {
                            startDateController.text = formattedDate;
                          });
                        }
                      }),
                  TextFormField(
                      controller: endDateController,
                      decoration:
                          const InputDecoration(labelText: "Fecha de termino"),
                      onTap: () async {
                        lastDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2025));
                        if (lastDate != null) {
                          String formattedDate =
                              DateFormat('dd-MM-yyyy').format(lastDate!);
                          setState(() {
                            endDateController.text = formattedDate;
                          });
                        }
                      }),
                  TextFormField(
                    controller: monthDurationController,
                    decoration:
                        const InputDecoration(labelText: "Meses de duración"),
                    onSaved: (value) {
                      // lugarValue = value;
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    child: const Text("Crear oferta"),
                    onPressed: () {
                      OfferPost offer = OfferPost(
                          title: titleController.text,
                          description: descriptionController.text,
                          paymentAmount:
                              double.parse(paymentAmountController.text),
                          monthDuration:
                              int.parse(monthDurationController.text),
                          startDate: startDate!.toIso8601String(),
                          endDate: lastDate!.toIso8601String(),
                          specialtyId: specialtyId);
                      postOffer(offer);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmployerHomePage()));
                    },
                  )
                ]),
              ),
            ),
          )),
    );
  }
}
