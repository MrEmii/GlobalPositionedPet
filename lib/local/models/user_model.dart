class User {
  String id;
  String token;
  String username;
  String profilePic;


  User({
    this.id,
    this.username,
    this.profilePic,
    this.token
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    profilePic: json["profilePic"],
    token: json["token"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "profilePic": profilePic,
    "token": token
  };
}