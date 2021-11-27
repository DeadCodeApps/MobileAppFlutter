
import 'package:freelance_world_flutter/models/specialty.dart';
import 'dart:convert';

OfferPost offerFromJson(String str) => OfferPost.fromJson(json.decode(str));

String offerToJson(OfferPost data) => json.encode(data.toJson());

class OfferPost {
  OfferPost({
    this.title,
    this.description,
    this.paymentAmount,
    this.monthDuration,
    this.specialtyId,
    this.startDate,
    this.endDate,
  });

    int? id;
  String? title;
  String? description;
  double? paymentAmount;
  int? monthDuration;
  int? specialtyId;
  String? startDate;
  String? endDate;
  bool? active;

  factory OfferPost.fromJson(Map<String, dynamic> json) => OfferPost(
        title: json["title"],
        description: json["description"],
        paymentAmount: json["paymentAmount"],
        monthDuration: json["monthDuration"],
        startDate: json['startDate'],
        endDate: json['endDate'],
        specialtyId: json["specialtyId"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "paymentAmount": paymentAmount,
        "monthDuration": monthDuration,
        "startDate": startDate,
        "endDate": endDate,
        "specialtyId": specialtyId,
      };
}
