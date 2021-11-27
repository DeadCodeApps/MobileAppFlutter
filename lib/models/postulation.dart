import 'dart:convert';

Postulation offerFromJson(String str) => Postulation.fromJson(json.decode(str));

String offerToJson(Postulation data) => json.encode(data.toJson());

class Postulation {
  Postulation({
    this.desiredPayment,
    this.description,
  });

  int? desiredPayment;
  String? description;

  factory Postulation.fromJson(Map<String, dynamic> json) => Postulation(
        desiredPayment: json['desiredPayment'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        "desiredPayment": desiredPayment,
        "description": description,
      };
}
