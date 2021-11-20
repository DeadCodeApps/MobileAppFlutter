// To parse this JSON data, do
//
//     final certificate = certificateFromJson(jsonString);

import 'dart:convert';

Certificate certificateFromJson(String str) =>
    Certificate.fromJson(json.decode(str));

String certificateToJson(Certificate data) => json.encode(data.toJson());

class Certificate {
  Certificate({
    required this.id,
    required this.certificateUrl,
  });

  int id;
  String certificateUrl;

  factory Certificate.fromJson(Map<String, dynamic> json) => Certificate(
        id: json["id"],
        certificateUrl: json["certificate_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "certificate_url": certificateUrl,
      };
}
