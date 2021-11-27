import 'dart:convert';

Postulation PostulationFromJson(String str) =>
    Postulation.fromJson(json.decode(str));

String PostulationToJson(Postulation data) => json.encode(data.toJson());

class Postulation {
  Postulation({
    this.id,
    this.desiredPayment,
    this.description,
    this.state,
    this.freelancerId,
    this.firstname,
    this.lastname,
    this.title,
    this.offerdescription,
    this.paymentAmount,
  });

  int? id;
  double? desiredPayment;
  String? description;
  String? state;
  int? freelancerId;
  String? firstname;
  String? lastname;
  String? title;
  String? offerdescription;
  double? paymentAmount;

  factory Postulation.fromJson(Map<String, dynamic> json) => Postulation(
        id: json["id"],
        desiredPayment: json["desiredPayment"],
        description: json["description"],
        state: json["state"],
        freelancerId: json["freelancerId"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        title: json["title"],
        offerdescription: json["offerdescription"],
        paymentAmount: json["paymentAmount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "desiredPayment": desiredPayment,
        "description": description,
        "state": state,
        "freelancerId": freelancerId,
        "firstname": firstname,
        "lastname": lastname,
        "title": title,
        "offerdescription": offerdescription,
        "paymentAmount": paymentAmount,
      };
}
