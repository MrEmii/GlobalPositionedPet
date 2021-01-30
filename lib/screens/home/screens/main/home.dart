import 'package:flutter/material.dart';
import 'package:gpp/screens/home/screens/main/widgets/pet_activity.dart';
import 'package:gpp/screens/home/screens/main/widgets/pet_card.dart';
import 'package:gpp/screens/home/screens/main/widgets/home_header.dart';
import 'package:gpp/screens/home/screens/providers/userprovider.dart';
import 'package:gpp/widgets/gppcolors.dart';
import 'package:gpp/widgets/gppicons.dart';
import 'package:gpp/widgets/gradient.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {

  Home();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _refreshKey = new GlobalKey<RefreshIndicatorState>();

  UserProvider model;


  @override
  void initState() {
    this.model = Provider.of<UserProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return SafeArea(
        child: Container(
          child: ListView(
            children: [
              HomeHeader(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 210,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: this.model.mascots.length + 1,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  itemBuilder: (context, index){
                    bool last = index == model.mascots.length;
                    if(last){
                      return GestureDetector(
                        onTap: () => Navigator.pushNamed(context, "/create_pet"),
                        child: Container(
                          width: 327,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(37),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black45,
                                blurRadius: 4
                              )
                            ]
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GradientComponent(child: Icon(GPPIcons.plus, size: 48, color: Colors.white,), gradient: GPPColors.azurLane),
                              Visibility(
                                visible: this.model.mascots.isEmpty,
                                child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     GradientComponent(child: Text("Da el salto!", style: TextStyle(fontSize: 24, color: Colors.white),), gradient: GPPColors.azurLane,),
                                     Padding(
                                       padding: const EdgeInsets.symmetric(horizontal: 20),
                                       child: Text("Para añadir una mascota vamos a requerir saber un poco más de vos!", textAlign: TextAlign.center, softWrap: true, style: TextStyle(fontSize: 12, color: GPPColors.white25),),
                                     )
                                   ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }else{
                      return PetCard(model: model.mascots[index],);
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Últimas actualizaciones", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: GPPColors.black94),),
                    GestureDetector(
                      onTap: (){},//TODO: Update table
                      child: Icon(GPPIcons.refresh),
                    )
                  ],
                )
              )
            ],
          ),
        ),
      );
  }
}