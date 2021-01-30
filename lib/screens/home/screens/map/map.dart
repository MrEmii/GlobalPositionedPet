import 'dart:async';
import 'dart:convert';

import 'package:geolocator/geolocator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:gpp/screens/home/screens/providers/userprovider.dart';
import 'package:gpp/services/models/pet.dart';
import 'package:gpp/services/services.dart';
import 'package:gpp/widgets/gppicons.dart';
import 'package:gpp/widgets/text_input.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';

class PetLocationMap extends StatefulWidget {


  PetLocationMap();

  @override
  _PetLocationMapState createState() => _PetLocationMapState();
}

class _PetLocationMapState extends State<PetLocationMap> {

  Future<Position> fp;
  UserProvider model;

  final MapController controller = MapController();

  var mapa;
  var markeds = [
    {
      "nombre": "Aurora",
      "type": "dog",
      "long": -58.745642,
      "lat": -34.5542267
    },
    {
      "nombre": "Quimera",
      "type": "cat",
      "long": -58.74533,
      "lat": -34.555625
    },
    {
      "nombre": "Haru",
      "type": "cat",
      "long": -58.745583,
      "lat": -34.553489
    }
  ];

  List<Marker> ubs = [];

  loadMap() async{
    String response = await Services.getVeterinarias();
    this.mapa = json.decode(response);
    this.mapa.forEach((string, value){
      value.forEach((string2, value2) {
        value2.forEach((loc) {
          Marker mar = new Marker(
            width: 50.0,
            height: 50.0,
            point: new LatLng(loc["position"][0], loc["position"][1]),
            builder: (ctx) {
              return GestureDetector(
                onTap: () => print(loc["name"]),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(color: Colors.grey, blurRadius: 10.0)
                  ]),
                  child: Icon(GPPIcons.shop)
                ),
              );
            }
          );

          ubs.add(mar);
        });
      });
    });
  }

  @override
  void initState() {
    this.model = Provider.of<UserProvider>(context, listen: false);

    this.fp = Geolocator().getLastKnownPosition(desiredAccuracy: LocationAccuracy.high);
    this.markeds.forEach((element) {
        PetModel m = this.model.mascots.firstWhere((pet) => pet.name == element["nombre"]);
        Marker mar = new Marker(
          width: 50.0,
          height: 50.0,
          point: new LatLng(element["lat"], element["long"]),
          builder: (ctx) {
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/pet", arguments: m),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(color: Colors.grey, blurRadius: 10.0)
                ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(m.photo, fit: BoxFit.cover,),
                ),
              ),
            );
          }
        );

        ubs.add(mar);
    });

    //this.loadMap();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: this.fp,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.hasData){
          return Stack(
            children: [
              FlutterMap(
                mapController: this.controller,
                options: MapOptions(
                  center: new LatLng(snapshot.data.latitude, snapshot.data.longitude),
                  zoom: 17.0,
                  maxZoom: 17,
                  minZoom: 12
                ),
                layers: [
                  new TileLayerOptions(
                    urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                    retinaMode: true
                  ),
                  new MarkerLayerOptions(
                    markers: this.ubs,
                  ),
                ]
              ),
              Container(
                padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                child: TextInputComponent(
                  width: MediaQuery.of(context).size.width,
                  placeholder: "Buscar",
                  suffixIcon: Icon(GPPIcons.search),
                  onSubmit: (text) {
                    var getLocation = this.markeds.firstWhere((element) => element["nombre"] == text);
                    print(this.controller.zoom);
                    setState(() {
                      controller.move(new LatLng(getLocation["lat"], getLocation["long"]), 18);
                    });
                  },
                ),
              ),
            ],
          );
        }else{
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black)),
              Padding(padding: EdgeInsets.only(top: 20))
            ]
          );
        }
      },
    );
  }
}
