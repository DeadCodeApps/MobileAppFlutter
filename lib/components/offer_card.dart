import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:math';

import 'package:freelance_world_flutter/models/offer.dart';
import 'package:freelance_world_flutter/services/freelancer_service.dart';
import 'package:freelance_world_flutter/services/user_service.dart';
import 'package:freelance_world_flutter/theme/constants.dart';
import 'package:freelance_world_flutter/views/freelancer/freelacer_postulate/offer_detail_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OfferCard extends StatelessWidget {
  final Offer offer;
  const OfferCard({required this.offer});

  @override
  Widget build(BuildContext context) {
    /*String userTypeOffer = "";
    Future<String> getUserTypeOffer() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final int userId = int.parse(prefs.getString('id')!);
      return getUsertype(userId.toString());
    }*/

    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => OfferDetail(offer: offer)));
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 5,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min, // add this
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                      child: Flexible(
                        child: Text(
                          utf8.decode(offer.title.toString().runes.toList()),
                          style: const TextStyle(
                              fontSize: 20.0, color: primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Especialidad: " +
                            utf8.decode(offer.specialty!.name
                                .toString()
                                .runes
                                .toList()),
                        style: const TextStyle(
                            fontSize: 20.0, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                          utf8.decode(
                              offer.description.toString().runes.toList()),
                          style: const TextStyle(
                              fontSize: 17.0, color: Colors.black54),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Presupuesto: " +
                        "S/" +
                        utf8.decode(
                            offer.paymentAmount.toString().runes.toList()),
                    style:
                        TextStyle(fontSize: 20.0, color: Colors.green.shade600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
