import 'package:flutter/material.dart';
import 'package:freelance_world_flutter/models/offer.dart';
import 'package:freelance_world_flutter/views/freelancer/freelacer_postulate/postulation_steps.dart';

import 'dart:convert';
import 'dart:math';

import 'package:intl/intl.dart';

class OfferDetailed extends StatelessWidget {
  final Offer offer;
  const OfferDetailed({required this.offer});

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd - MM - yyyy');
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 5,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min, // size
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 5,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.max, // size
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            utf8.decode(offer.title!.toString().runes.toList()),
                            style: TextStyle(
                                fontSize: 22.0, color: Colors.blue.shade900),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            utf8.decode(offer.specialty!.name
                                .toString()
                                .runes
                                .toList()),
                            style: const TextStyle(
                                fontSize: 18.0, color: Colors.black54),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            "Sueldo: S/ " +
                                utf8.decode(offer.paymentAmount!
                                    .toString()
                                    .runes
                                    .toList()),
                            style: const TextStyle(
                                fontSize: 16.0, color: Colors.black45),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      "Detalles del aviso",
                      style: TextStyle(
                          fontSize: 22.0, color: Colors.blue.shade900),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      utf8.decode(offer.description!.toString().runes.toList()),
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                          fontSize: 18.0, color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      "Tiempo de contrato (meses): " +
                          offer.monthDuration.toString(),
                      style: TextStyle(fontSize: 17.0, color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      "Inicio: " + formatter.format(offer.startDate!),
                      style: TextStyle(fontSize: 17.0, color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      "Fin: " + formatter.format(offer.endDate!),
                      style: TextStyle(fontSize: 17.0, color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: PopUpConfirmation(offer: offer),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PopUpConfirmation extends StatelessWidget {
  final Offer offer;
  const PopUpConfirmation({required this.offer});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('¿Proceder al proceso de postulación?'),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PostulationSteps(offer: offer)));
                  },
                  child: const Text('Aceptar'),
                  style: ElevatedButton.styleFrom(
                      padding:
                          const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                      primary: Colors.blue.shade900,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                ),
                SizedBox(width: 25.0),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancelar'),
                  style: ElevatedButton.styleFrom(
                      padding:
                          const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                      primary: Colors.blue.shade900,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
      child: const Text(
        'POSTULARME',
        style: TextStyle(fontSize: 20.0),
      ),
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 15.0),
          primary: Colors.blue.shade900,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          )),
    );
  }
}
