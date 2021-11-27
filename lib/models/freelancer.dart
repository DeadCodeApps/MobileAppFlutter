// To parse this JSON data, do
//
//     final freelancer = freelancerFromJson(jsonString);

import 'dart:convert';

Freelancer freelancerFromJson(String str) =>
    Freelancer.fromJson(json.decode(str));

String freelancerToJson(Freelancer data) => json.encode(data.toJson());

class Freelancer {
  Freelancer({
    this.id,
    this.username,
    this.email,
    this.password,
    this.firstname,
    this.lastname,
    this.webPage,
    this.facebookLink,
    this.instagramLink,
    this.twitterLink,
    this.imageUrl,
    this.birthDate,
    this.phone,
    this.description,
    this.profession,
  });

  int? id;
  String? username;
  String? email;
  String? password;
  String? firstname;
  String? lastname;
  String? webPage;
  String? facebookLink;
  String? instagramLink;
  String? twitterLink;
  String? imageUrl;
  DateTime? birthDate;
  String? phone;
  String? description;
  String? profession;

  factory Freelancer.fromJson(Map<String, dynamic> json) => Freelancer(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        webPage: json["webPage"],
        facebookLink: json["facebookLink"],
        instagramLink: json["instagramLink"],
        twitterLink: json["twitterLink"],
        imageUrl: json["imageUrl"],
        birthDate: (json["birthDate"]),
        phone: json["phone"],
        description: json["description"],
        profession: json["profession"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "password": password,
        "firstname": firstname,
        "lastname": lastname,
        "webPage": webPage,
        "facebookLink": facebookLink,
        "instagramLink": instagramLink,
        "twitterLink": twitterLink,
        "imageUrl": imageUrl,
        "birthDate": birthDate?.toIso8601String(),
        "phone": phone,
        "description": description,
        "profession": profession,
      };
}
