class User {
  User({
    this.firstname,
    this.lastname,
    this.email,
  });

  String? firstname;
  String? lastname;
  String? email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstname: json["firstlastname"],
        lastname: json["lastname"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
      };

  String getFullName() {
    return firstname! + ' ' + lastname!;
  }
}
