import 'package:flutter/material.dart';
import 'package:gpp/screens/createPet/create_pet_provider.dart';
import 'package:gpp/screens/createPet/views/pet_info.dart';
import 'package:gpp/screens/createPet/views/sending.dart';
import 'package:gpp/screens/createPet/views/user_info.dart';
import 'package:gpp/widgets/button.dart';
import 'package:gpp/widgets/gppcolors.dart';
import 'package:provider/provider.dart';


class CreatePetView extends StatefulWidget {
  CreatePetView();

  @override
  _CreatePetViewState createState() => _CreatePetViewState();
}

class _CreatePetViewState extends State<CreatePetView> {

  final _controller = PageController(initialPage: 0);
  CreatePetProvider provider;
  double currentProgress = 0;
  int nextPage = 0;

  @override
  void initState() {
    this.provider = Provider.of<CreatePetProvider>(context, listen: false);

    this._controller.addListener(() => setState(() { if (_controller.page % 1 == 0) currentProgress = _controller.page; }));

    super.initState();
  }

  goToPage(int page){
    _controller.animateToPage(page, duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
    setState(() {
      this.nextPage = page;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                child: PageView(
                  controller: _controller,
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    PetInformation(),
                    UserInformation(),
                    SendingInformation()
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 60,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: this.nextPage == 1 ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible:  this.nextPage == 1,
                      child: GestureDetector(
                        onTap: () {
                          if(this.nextPage <= 0) return;
                          FocusScope.of(context).unfocus();
                          this.goToPage(this._controller.page.round() - 1);
                        },
                        child: FittedBox(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                            child: Center(
                              child: Text("Volver",
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal)
                                )
                              ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)
                            ),
                          ),
                        ),
                      )
                    ),
                    ButtonComponent(
                      width:  this.nextPage > 0 ? 230 : MediaQuery.of(context).size.width - 80,
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        if(this.nextPage < 2 ){
                          this.goToPage(this._controller.page.round() + 1);
                        }else if(this.nextPage == 2){
                          //Crear mascota
                          Navigator.pop(context);
                        }
                      },
                      text: Center(
                        child: Text(this.nextPage != 2 ? "Continuar" : "Volver al inicio",
                        style: TextStyle(
                          color: GPPColors.white18,
                          fontSize: 15,
                          fontWeight: FontWeight.normal
                          )
                        )
                      )
                    )
                  ],
                ),
              ),
            )
          ]
        ),
      ),
    );
  }
}
