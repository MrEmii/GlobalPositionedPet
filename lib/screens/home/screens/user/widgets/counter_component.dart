import 'package:flutter/material.dart';
import 'package:gpp/widgets/gppcolors.dart';

class CounterElement extends StatelessWidget {

  final String title;
  final int value;

  CounterElement({this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(this.title, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: GPPColors.white42),),
          Text(this.value.toString(), style: TextStyle(color: GPPColors.blackBlue90),)
        ],
      ),
    );
  }
}