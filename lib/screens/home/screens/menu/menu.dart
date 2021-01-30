import 'package:flutter/material.dart';
import 'package:gpp/screens/home/screens/menu/widgets/notifys_card.dart';
import 'package:gpp/screens/home/screens/providers/userprovider.dart';
import 'package:gpp/widgets/gppcolors.dart';
import 'package:gpp/widgets/gppicons.dart';
import 'package:gpp/widgets/text_input.dart';

class MenuWrapper extends StatefulWidget {

  const MenuWrapper();

  @override
  _MenuWrapperState createState() => _MenuWrapperState();
}

class _MenuWrapperState extends State<MenuWrapper> {

  final TextEditingController _filterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
        gradient: GPPColors.gradientLove
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Notificaciones", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white),),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(GPPIcons.trash_alt, color: Colors.white,),
              )
            ],
          ),
          SizedBox(height: 20,),
          SizedBox(
            height: 40,
            child: TextInputComponent(
              width: MediaQuery.of(context).size.width,
              controller: this._filterController,
              suffixIcon: GestureDetector(
                onTap: () => {
                  print(this._filterController.text)
                },
                child: Icon(GPPIcons.filter),
              ),
              placeholder: "Buscar por titulo"
            ),
          ),

          NotifyCard(
            title: "Tu collar se está enviando!",
            description: "Hola Emir tu collar está siendo enviado."
          )
        ],
      ),
    );
  }
}