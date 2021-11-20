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
    this.title,
    this.description,
    this.paymentAmount,
    this.monthDuration,
    this.specialty,
    this.active,
  });

  int? id;
  String? title;
  String? description;
  double? paymentAmount;
  int? monthDuration;
  Specialty? specialty;
  bool? active;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        paymentAmount: json["paymentAmount"],
        monthDuration: json["monthDuration"],
        specialty: Specialty.fromJson(json["specialty"]),
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "paymentAmount": paymentAmount,
        "monthDuration": monthDuration,
        "specialty": specialty == null ? null : specialty!.toJson(),
        "active": active,
      };
}
