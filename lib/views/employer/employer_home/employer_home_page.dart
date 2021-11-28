// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:freelance_world_flutter/components/offer_card.dart';
import 'package:freelance_world_flutter/models/offer.dart';
import 'package:freelance_world_flutter/shared/http_interceptor.dart';
import 'package:freelance_world_flutter/shared/side_menu.dart';
import 'package:freelance_world_flutter/theme/constants.dart';
import 'package:freelance_world_flutter/views/employer/employer_publish_offer/employer_publish_offer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmployerHomePage extends StatefulWidget {
  @override
  _EmployerHomePageState createState() => _EmployerHomePageState();
}

class _EmployerHomePageState extends State<EmployerHomePage> {
  late List<Offer> offers;

  List<Offer> parseOffers(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Offer>((json) => Offer.fromJson(json)).toList();
  }

  Future<List<Offer>> getOffers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int employerId = int.parse(prefs.getString('id')!);
    var httpClient = AuthenticatedHttpClient();
    final response = await httpClient.get(
      Uri.parse(
          "https://freelance-world.herokuapp.com/api/employers/$employerId/offers"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return parseOffers(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load offers');
    }
  }

  @override
  initState() {
    super.initState();
    getOffers();
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
      body: FutureBuilder<List<Offer>>(
        future: getOffers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? OfferList(
                  offers: snapshot.data ?? [],
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class OfferList extends StatelessWidget {
  final List<Offer> offers;
  const OfferList({required this.offers});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => NewOffer()));
            },
            child: const Text("Añadir"),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: offers == null ? 0 : offers.length,
            itemBuilder: (context, i) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: OfferCard(
                              offer: offers[i],
                            )),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
