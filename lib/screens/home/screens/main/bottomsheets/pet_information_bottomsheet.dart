import 'package:flutter/material.dart';

class PetInformationBottomSheet extends StatelessWidget {
  const PetInformationBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Column(      
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text("Quimera 🐈", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(text: TextSpan(children: [
            TextSpan(text: "Último movimiento hace: 1 hora"),
            TextSpan(text: "\nPasos en total: 142"),
            TextSpan(text: "\nKilometros en total: 0.41km"),
            ]), softWrap: true,
          ),
        ),
        SizedBox(height: 10),

      ],
    );
  }
}