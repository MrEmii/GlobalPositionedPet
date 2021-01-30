import 'package:flutter/material.dart';
import 'package:gpp/widgets/gppicons.dart';
import 'package:gpp/widgets/text_input.dart';
import '../../../../../services/models/login_model.dart';

class HomeHeader extends StatelessWidget {

  final LoginModel model;

  const HomeHeader({this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(18), bottomRight: Radius.circular(18))
      ),
      padding: EdgeInsets.only(top: 40, left: 20, right: 20),
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Tus Mascotas", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
              GestureDetector(
                onTap: () => Scaffold.of(context).openEndDrawer(),
                child: Icon(GPPIcons.bell),
              )
            ],
          ),
          SizedBox(height: 20,),
          TextInputComponent(
            width: MediaQuery.of(context).size.width,
            prefixIcon: Icon(GPPIcons.search),
            placeholder: "Buscar"
          )
        ],
      ),
    );
  }

}