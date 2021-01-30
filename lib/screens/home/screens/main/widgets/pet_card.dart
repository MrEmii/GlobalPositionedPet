import 'package:flutter/material.dart';
import 'package:gpp/services/models/pet.dart';
import 'package:gpp/widgets/gppcolors.dart';

class PetCard extends StatelessWidget {

  final PetModel model;

  PetCard({this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "/pet", arguments: this.model),
      child: Container(
        width: 327,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(image: NetworkImage(model.photo), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(37),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 4
            )
          ]
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(37),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                width: 327,
                height: 100,
                decoration: BoxDecoration(
                  gradient: GPPColors.blackToTransparent
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(model.name, textAlign: TextAlign.start, style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
                    Text("Sin actividades", textAlign: TextAlign.start, style: TextStyle(color: GPPColors.white18, fontSize: 14, fontWeight: FontWeight.w500),),
                  ]
                ) ,
              )
            ],
          ),
        ),
      ),
    );
  }
}