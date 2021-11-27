// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:math';

import 'package:freelance_world_flutter/models/postulation.dart';
import 'package:freelance_world_flutter/views/freelancer/send_message/send_message_page.dart';

class PostulationCard extends StatelessWidget {
  final Postulation postulation;
  const PostulationCard({required this.postulation});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(postulation.id);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 10, offset: Offset(0, 5))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Lima, Perú",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        utf8.decode(
                            postulation.title.toString().runes.toList()),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromRGBO(81, 171, 216, 1),
                        )),
                    Text(
                        "S/." +
                            utf8.decode(postulation.paymentAmount
                                .toString()
                                .runes
                                .toList()),
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        )),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Full Time",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[500],
                    )),
                Row(
                  children: [
                    IconButton(
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SendMessagePage(
                                      "W.W. Technology",
                                      utf8.decode(postulation.title
                                          .toString()
                                          .runes
                                          .toList()))));
                        },
                        icon: Icon(Icons.message)),
                    Text("Pendiente",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[500],
                        )),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
