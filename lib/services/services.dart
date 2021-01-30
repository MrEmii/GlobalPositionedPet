import 'package:gpp/services/consumer.dart';

class Services{

  static Future<String> signIn({user, password}) async {
    return await Consumer.post(
      url: "http://192.168.0.8:3000/signin",
      body: {
        "user": user,
        "password": password
      }
    );//TODO: Return user data
  }

   static Future<String> authenticateToken({token}) async {
    return await Consumer.post(
      url: "http://192.168.0.8:3000/authenticate",
      body: {
        "token": token
      }
    );//TODO: Return user data
  }

  static Future<String> getPetLocations({id}) async {
    return await Consumer.post(
      url: "",
      body: {
        "token": id,
        "timestamp": "123"
      }
    );// TODO: Returned data be like: [ ...{ pet: {PETDATA}, lat: INT, lon: INT, lastupdate: timemilis }  ]
  }

  static Future<String> getPetInformation({id, petID}) async {
    return await Consumer.post(
      url: "",
      body: {
        "id": id,
        "pet": id,
        "timestamp": "123"
      }
    );//TODO: Returned data be like: { pet: {PETDATA}, lat: INT, lon: INT, lastupdate: timemilis }
  }

  static Future<String> getVeterinarias() async {
    return await Consumer.post(
      url: "http://147.135.30.239:7773/mapa",
      body: {
        "test": "TEST"
      }
    );//TODO: Returned data be like: { pet: {PETDATA}, lat: INT, lon: INT, lastupdate: timemilis }
  }


}