class LoginModel {

  String id, email, name, lastname, username, birthdate, street, number, floor, county, country, cellphone, city, photo, cp;

  LoginModel({this.id, this.email, this.name, this.lastname, this.username, this.birthdate, this.street, this.city, this.number, this.floor, this.county, this.country, this.cp, this.cellphone, this.photo});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    id: json["id"],
    email: json["email"],
    name: json["name"],
    lastname: json["lastname"],
    username: json["username"],
    birthdate: json["birthdate"],
    street: json["street"],
    number:json[" number"],
    floor: json["floor"],
    county: json["county"],
    city: json["city"],
    cp: json["cp"],
    country: json["country"],
    cellphone: json["cellphone"],
    photo: json["photo"]
  );

}