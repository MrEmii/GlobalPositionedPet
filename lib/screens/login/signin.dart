import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gpp/local/local_data.dart';
import 'package:gpp/local/models/user_model.dart';
import 'package:gpp/screens/home/screens/providers/userprovider.dart';
import 'package:gpp/services/models/login_model.dart';
import 'package:gpp/services/services.dart';
import 'package:gpp/utils/RegExpUtil.dart';
import 'package:gpp/widgets/button.dart';
import 'package:gpp/widgets/future_button.dart';
import 'package:gpp/widgets/gppcolors.dart';
import 'package:gpp/widgets/gppicons.dart';
import 'package:gpp/widgets/gradient.dart';
import 'package:gpp/widgets/text_button.dart';
import 'package:gpp/widgets/text_input.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  SignIn();

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isFetching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 50),
                child: Text("¡Ingresa en tu cuenta!", textAlign: TextAlign.center, style: TextStyle(fontSize: 28, color: Colors.black),),
              ),
              Form(
                key: this._formKey,
                child: Column(
                  children: [
                    TextInputComponent(
                      controller: this._mailController,
                      width: MediaQuery.of(context).size.width / 1.3,
                      placeholder: "Usuario",
                      passwordEnabled: false,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      validator: (mail) {
                        if(mail == null || mail.trim().isEmpty)
                          return "Necesitamos tu usuario!";
                        return null;
                      },
                      placeholderStyle: TextStyle(
                        fontSize: 18,
                        color: GPPColors.white18
                      ),
                    ),
                    TextInputComponent(
                      controller: this._passwordController,
                      width: MediaQuery.of(context).size.width / 1.3,
                      margin: EdgeInsets.only(top: 10, bottom: 20),
                      placeholder: "Contraseña",
                      passwordEnabled: true,
                      validator: (password){
                        if(password == null || password.trim().isEmpty)
                          return "¿Tenes contraseña?";
                        return null;
                      },
                      placeholderStyle: TextStyle(
                        fontSize: 18,
                        color: GPPColors.white18
                      ),
                    )
                  ],
                ),
              ),
              FutureButton(
                onTap: () async {
                  if(_formKey.currentState.validate()){
                    setState(() {
                      this.isFetching = true;
                    });
                    var response = await Services.signIn(user: this._mailController.text.trim(), password: this._passwordController.text.trim());
                    var resDecode = json.decode(response);
                    print(resDecode);
                    if(resDecode["code"] == 202){
                      Services.authenticateToken(token: resDecode["token"]).then((res) {
                        var authDec = json.decode(res);
                        if(authDec["code"] == 202){
                          LoginModel loginModel = LoginModel.fromJson(authDec["user"]);
                          UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);

                          User user = User(
                            id:  loginModel.id,
                            profilePic: loginModel.photo,
                            username: loginModel.username,
                            token: resDecode["token"]
                          );

                          LocalData.db.addUser(user).then((dbRes) {
                            LocalData.user = user;
                            userProvider.user = loginModel;
                            Navigator.pushReplacementNamed(context, "/home");
                          });

                        }else{

                        }
                      });
                    }else{

                    }

                    print(resDecode["token"]);

                    setState(() {
                      this.isFetching = false;
                    });
                  }
                },
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: MediaQuery.of(context).size.width / 5,),
                text: Text("Ingresar", style: TextStyle(fontSize: 15, color: GPPColors.white25),)
              ),
              TextButton(
                width: MediaQuery.of(context).size.width / 2,
                text: Text("¿Olvidaste tu contraseña?", style: TextStyle(color: GPPColors.white42, fontSize: 12),),
              ),
              SizedBox(
                height: 3,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: GPPColors.white25
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text("¿No tenes una cuenta?", textAlign: TextAlign.center, style: TextStyle(color: GPPColors.grey57, fontWeight: FontWeight.w500, fontSize: 12)),
              ),
              ButtonComponent(
                onTap: () async {
                  Navigator.pushNamed(context, "/signup");
                },
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                height: 40,
                text: Text("Registrate", style: TextStyle(fontSize: 12, color: GPPColors.white25),)
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text("O ingresa con", textAlign: TextAlign.center, style: TextStyle(color: GPPColors.grey57, fontWeight: FontWeight.w500, fontSize: 12)),
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FutureButton(
                      onTap: () async {
                        print("GOOGLE SIGN IN");
                      },
                      child: Image.asset("assets/images/google_logo.png", width: 30, height: 30),
                    ),
                    FutureButton(
                      onTap: () async {
                      },
                      child: Icon(GPPIcons.facebook, color: GPPColors.facebookColor),
                    ),
                    FutureButton(
                      onTap: () async {
                        print("Twitter SIGN IN");
                      },
                      child: GradientComponent(
                        child: Icon(GPPIcons.twitter, color: Colors.white,),
                        gradient: GPPColors.twitterGradient,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}