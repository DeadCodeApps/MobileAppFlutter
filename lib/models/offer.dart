// To parse this JSON data, do
//
//     final offer = offerFromJson(jsonString);

// ignore_for_file: unnecessary_null_comparison, prefer_null_aware_operators

import 'package:freelance_world_flutter/models/specialty.dart';
import 'dart:convert';

Offer offerFromJson(String str) => Offer.fromJson(json.decode(str));

String offerToJson(Offer data) => json.encode(data.toJson());

class Offer {
  Offer({
    this.id,
    required this.title,
    required this.description,
    required this.paymentAmount,
    required this.monthDuration,
    required this.startDate,
    required this.endDate,
    required this.specialty,
    required this.active,
  });

  final int? id;
  final String title;
  final String description;
  final double paymentAmount;
  final int monthDuration;
  final DateTime startDate;
  final DateTime endDate;
  final Specialty specialty;
  final bool? active;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        paymentAmount: json["paymentAmount"],
        monthDuration: json["monthDuration"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        specialty: Specialty.fromJson(json["specialty"]),
        // specialtyId: json["specialtyId"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "paymentAmount": paymentAmount,
        "monthDuration": monthDuration,
        "startDate": startDate,
        "endDate": endDate,
        "specialty": specialty == null ? null : specialty!.toJson(),
        // "specialtyId": specialtyId,
        "active": active,
      };
}
