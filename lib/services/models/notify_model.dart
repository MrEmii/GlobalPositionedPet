class NotifyModel{


  final String title, description, id, time;
  final NotifyType type;

  NotifyModel({this.title, this.description, this.time, this.id, this.type});

  factory NotifyModel.fromJson(Map<String, dynamic> json) => NotifyModel(
    title: json["title"],
    description: json["description"],
    time: json["time"],
    id: json["id"],
    type: NotifyType.values.singleWhere((element) => element.toString() == json["type"])
  );
}
enum NotifyType {
  APP, SOCIAL, PET
}
