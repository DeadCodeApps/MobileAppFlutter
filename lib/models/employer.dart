import 'dart:convert';

Employer employerFromJson(String str) => Employer.fromJson(json.decode(str));

String employerToJson(Employer data) => json.encode(data.toJson());

class Employer {
  Employer({
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
    this.personalPhone,
    this.description,
    this.companyPhone,
    this.companyName,
    this.companyWeb,
    this.contactCompanyEmail,
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
  String? personalPhone;
  String? description;
  String? companyPhone;
  String? companyName;
  String? companyWeb;
  String? contactCompanyEmail;

  factory Employer.fromJson(Map<String, dynamic> json) => Employer(
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
        personalPhone: json["personalPhone"],
        description: json["description"],
        companyPhone: json["companyPhone"],
        companyName: json["companyName"],
        companyWeb: json["companyWeb"],
        contactCompanyEmail: json["contactCompanyEmail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "password": email,
        "firstname": firstname,
        "lastname": lastname,
        "webPage": webPage,
        "facebookLink": facebookLink,
        "instagramLink": instagramLink,
        "twitterLink": twitterLink,
        "imageUrl": imageUrl,
        "personalPhone": personalPhone,
        "description": description,
        "companyPhone": companyPhone,
        "companyName": companyName,
        "companyWeb": companyWeb,
        "contactCompanyEmail": contactCompanyEmail,
      };
}
