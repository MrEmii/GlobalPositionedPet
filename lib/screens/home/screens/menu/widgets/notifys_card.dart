import 'package:flutter/material.dart';
import 'package:gpp/widgets/gppcolors.dart';

class NotifyCard extends StatelessWidget {

  final String title;
  final String description;
  Function onTap;

  NotifyCard({this.title, this.description, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap ?? () {},//TODO: Remover notificacioón del menu,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(this.title, style: TextStyle(fontSize: 13, color: GPPColors.white42, fontWeight: FontWeight.normal),),
            Text(this.description, style: TextStyle(fontSize: 15, color: GPPColors.grey57, fontWeight: FontWeight.w500),)
          ],
        ),
      ),
    );
  }
}