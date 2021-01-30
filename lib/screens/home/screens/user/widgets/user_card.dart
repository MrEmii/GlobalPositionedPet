import 'package:flutter/material.dart';
import 'package:gpp/screens/home/screens/providers/userprovider.dart';
import 'package:gpp/screens/home/screens/user/widgets/counter_component.dart';
import 'package:gpp/widgets/gppcolors.dart';

class UserCard extends StatelessWidget {

  final UserProvider model;

  UserCard({this.model});

  @override
  Widget build(BuildContext context) {
    print(this.model.user.photo);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.width / 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            image: DecorationImage(image: NetworkImage(this.model.user.photo), fit: BoxFit.cover),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${this.model.user.name} ${this.model.user.lastname}", textAlign: TextAlign.start, style: TextStyle(color: GPPColors.blackBlue90, fontWeight: FontWeight.w500, fontSize: 18),),
            Text("${this.model.user.username}", textAlign: TextAlign.start, style: TextStyle(color: GPPColors.blackBlue90, fontWeight: FontWeight.w400),),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: GPPColors.white07,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CounterElement(
                    title: "Mascotas",
                    value: 5,
                  ),
                  CounterElement(
                    title: "Activos",
                    value: 3,
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}