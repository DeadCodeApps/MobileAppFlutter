// To parse this JSON data, do
//
//     final skill = skillFromJson(jsonString);

import 'dart:convert';

Skill skillFromJson(String str) => Skill.fromJson(json.decode(str));

String skillToJson(Skill data) => json.encode(data.toJson());

class Skill {
  Skill({
    required this.id,
    required this.name,
    required this.description,
    required this.level,
  });

  int id;
  String name;
  String description;
  String level;

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        level: json["level"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "level": level,
      };
}
