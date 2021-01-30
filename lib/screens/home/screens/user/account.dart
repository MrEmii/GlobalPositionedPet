import 'package:flutter/material.dart';
import 'package:gpp/local/local_data.dart';
import 'package:gpp/screens/home/screens/providers/userprovider.dart';
import 'package:gpp/screens/home/screens/user/widgets/user_card.dart';
import 'package:gpp/widgets/gppcolors.dart';
import 'package:provider/provider.dart';

class AccountView extends StatefulWidget {

  AccountView();

  @override
  _AccountViewState createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
                      gradient: GPPColors.gradientLove
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Colors.black26,
                            offset: Offset(0, 5)
                          )
                        ]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          UserCard(model: userProvider),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    //TODO: Editar perfil scren
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: GPPColors.white18,
                                        width: 2
                                      )
                                    ),
                                    child: Text("Configuración", style: TextStyle(fontSize: 12, color: GPPColors.white42),),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    LocalData.db.removeSession().then((_) {
                                      LocalData.user = null;
                                      Navigator.of(context)
                                        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: GPPColors.red60
                                    ),
                                    child: Text("Cerrar sesión", style: TextStyle(fontSize: 12, color: GPPColors.red),),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),

          ],
        ),
      )
    );
  }
}