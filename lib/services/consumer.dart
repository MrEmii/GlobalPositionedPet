import 'dart:convert';

import 'package:http/http.dart' as http;

class Consumer {

  static Future<dynamic> post({url, headers, body}) async {
    var response = await http.post(
      url,
      headers: headers == null ?
        {'Content-Type': 'application/json;charset=UTF-8'} :
        headers,
      body: json.encode(body)
    ).timeout(Duration(seconds: 10000), onTimeout: () {
      print("Servidor desconectado");
      return Future.value(null);
    }).catchError((Object error){
      print(error);
    });
    return response.body;
  }

   static Future<dynamic> get({url, headers, body}) async {
    var response = await http.get(
      url,
      headers: headers == null ?
        {'Content-Type': 'application/json;charset=UTF-8'} :
        headers,
    );

    return response.body;
  }

}