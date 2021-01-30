import 'package:flutter/material.dart';
import 'package:gpp/services/models/pet.dart';
import 'package:gpp/widgets/gppcolors.dart';
import 'package:gpp/widgets/gppicons.dart';

class PetActivityCard extends StatelessWidget {

  final PetModel model;
  final double bottomMargin;

  PetActivityCard(this.model, this.bottomMargin);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: this.bottomMargin),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: GPPColors.blackBlue90.withOpacity(0.5),
            width: 0.5
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 0),
            ),
          ]
        ),
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.black, Colors.white30, Colors.transparent],
                    ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.network(
                    this.model.photo,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 3, top: 10 ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(this.model.name, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24, height: 1.0)),
                      Icon(this.model.gender == "M" ? GPPIcons.venus : GPPIcons.mars, size: 14),
                    ],
                  ),
                  Text(this.model.race, style: TextStyle(color: GPPColors.blackBlue90, fontWeight: FontWeight.w500, height: 1.0)),
                ],
              )
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 22),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: GPPColors.green,
                    borderRadius: BorderRadius.circular(50)
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}