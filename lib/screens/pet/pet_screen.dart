import 'package:flutter/material.dart';
import 'package:gpp/screens/pet/widgets/ps_header.dart';
import 'package:gpp/services/models/pet.dart';
import 'package:gpp/widgets/gppcolors.dart';

class Pet extends StatelessWidget {

  Pet();

  @override
  Widget build(BuildContext context) {
    final PetModel model = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: PetScreenHeader(expandedHeight: 400, photo: model.photo, name: model.name),
            pinned: false,
          ),
          SliverFixedExtentList(
            itemExtent: 150,
            delegate: SliverChildListDelegate([
              Container(
                height: 100,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  gradient: GPPColors.burningOrange,
                  borderRadius: BorderRadiusDirectional.circular(18)
                ),
              ),
              Container(
                height: 100,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  gradient: GPPColors.azurLane,
                  borderRadius: BorderRadiusDirectional.circular(18)
                ),
              ),
              Container(
                height: 100,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  gradient: GPPColors.citrusPeel,
                  borderRadius: BorderRadiusDirectional.circular(18)
                ),
              ),
              Container(
                height: 100,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  gradient: GPPColors.gradientLove,
                  borderRadius: BorderRadiusDirectional.circular(18)
                ),
              ),
              Container(
                height: 100,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  gradient: GPPColors.burningOrange,
                  borderRadius: BorderRadiusDirectional.circular(18)
                ),
              ),
              Container(
                height: 100,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  gradient: GPPColors.burningOrange,
                  borderRadius: BorderRadiusDirectional.circular(18)
                ),
              )
            ]),
          )
        ],
      )
    );
  }
}

