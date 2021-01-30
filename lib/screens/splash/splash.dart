import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gpp/local/local_data.dart';
import 'package:gpp/local/models/user_model.dart';
import 'package:gpp/screens/home/screens/providers/userprovider.dart';
import 'package:gpp/services/models/login_model.dart';
import 'package:gpp/services/services.dart';
import 'package:gpp/widgets/gppcolors.dart';
import 'dart:async';

import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen();

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  UserProvider userProvider;
  bool charged = false;
  bool signin = false;
  bool error = false;
  var action;

  @override
  void initState() {
    this.userProvider = Provider.of<UserProvider>(context, listen: false);
    Future.delayed(Duration.zero, () {
      LocalData.db.queryUser().then((response) {
        print(response.length);
        if(response.length > 0){
          LocalData.user = User.fromJson(response.last);
          Services.authenticateToken(token: LocalData.user.token).then((res) {
            var authDec = json.decode(res);
            print(authDec);
            if(authDec["code"] == 202){
              this.signin = true;
              this.userProvider.user = LoginModel.fromJson(authDec["user"]);
            }else{
              LocalData.db.removeSession();
            }
            setState(() {
              this.charged = true;
            });
          }).catchError(() => setState(() => this.error = true));
        }else{
          Navigator.pushNamed(context, "/");
          setState(() {
            this.charged = true;
          });
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: GPPColors.gradientLove
        ),
        child: AnimatedContainer(
          width: this.charged ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.width - 100,
          height: this.charged ? MediaQuery.of(context).size.height : MediaQuery.of(context).size.height - 100,
          duration: Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
          onEnd: (){
            if(this.signin){
              Navigator.pushNamed(context, "/home");
            }else{
              Navigator.pushNamed(context, "/");
            }
          },
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: this.charged ? BorderRadius.zero : BorderRadius.circular(12)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 100),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/images/logo.png", width: 150,),
                      Text("Global Postioned Pet"),
                    ],
                  ),
                ),
              ),
              Center(child: CircularProgressIndicator())
            ],
          ),
        ),
      ),
    );
  }
}