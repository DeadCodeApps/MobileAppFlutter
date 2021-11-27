import 'dart:html';

import 'package:flutter/material.dart';
import 'package:freelance_world_flutter/components/offer_detailed.dart';
import 'package:freelance_world_flutter/models/offer.dart';
import 'package:freelance_world_flutter/shared/http_interceptor.dart';
import 'package:freelance_world_flutter/shared/side_menu.dart';
import 'package:freelance_world_flutter/theme/constants.dart';

class OfferDetail extends StatelessWidget {
  final Offer offer;
  const OfferDetail({required this.offer});

  @override
  Widget build(BuildContext context) {
    String topic = "DETALLES DE OFERTA DE TRABAJO";
    return Scaffold(
      appBar: AppBar(
        title: Text('FreelanceWorld'),
        actions: [],
        backgroundColor: primaryColor,
      ),
      drawer: MenuPage(),
      body: OfferDetailed(offer: offer),
    );
  }
}
