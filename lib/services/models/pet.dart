class PetModel{

  final String id;
  final String name;
  final String photo;
  final String gender;
  final String type;
  final String token;
  final String race;

  PetModel({this.id, this.name, this.photo, this.gender, this.type, this.token, this.race});

  factory PetModel.fromJson(Map<String, dynamic> json) => PetModel(
    id: json["id"],
    name: json["name"],
    photo: json["photo"],
    gender: json["gender"],
    type: json["type"],
    token: json["token"],
    race: json["json"]
  );
}