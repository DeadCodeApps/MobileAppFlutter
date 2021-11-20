class Specialty {
  Specialty({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory Specialty.fromJson(Map<String, dynamic> json) => Specialty(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
