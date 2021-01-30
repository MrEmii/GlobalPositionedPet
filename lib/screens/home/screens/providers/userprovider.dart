import 'package:flutter/foundation.dart';
import 'package:gpp/services/models/pet.dart';
import 'package:gpp/services/models/login_model.dart';

class UserProvider extends ChangeNotifier{

  LoginModel user;

  List<PetModel> mascots = [
    PetModel(name: "Quimera", type: "Gato", gender: "H", race: "Siamesa", photo: "https://pbs.twimg.com/media/Ee1ZP4UUMAAp95s?format=jpg&name=large"),
    PetModel(name: "Haru", type: "Gato", gender: "H", race: "Indefinido", photo: "https://pbs.twimg.com/media/Ee1WdqjXkAIXjx5?format=jpg&name=900x900"),
    PetModel(name: "Milo", type: "Perro", gender: "M", race: "Shitszu", photo: "https://pbs.twimg.com/media/Ee3IaHLWAAAF_Lq?format=jpg&name=small"),
    PetModel(name: "Aurora", type: "Perro", gender: "H", race: "Indefinido", photo: "https://pbs.twimg.com/media/Ee3IaHHXgAAJ7pi?format=jpg&name=small"),
    PetModel(name: "Benjamín", type: "Perro", gender: "M", race: "Caniche", photo: "https://pbs.twimg.com/media/Ee3IaHEXkAAwFbt?format=jpg&name=small")
  ];

  void notify(){
    notifyListeners();
    print("Notified Listeners");
  }
}