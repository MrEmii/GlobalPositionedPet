import 'package:flutter/material.dart';
import 'package:gpp/screens/createPet/create_pet_view.dart';
import 'package:gpp/screens/home/home_content.dart';
import 'package:gpp/screens/login/signin.dart';
import 'package:gpp/screens/pet/pet_screen.dart';
import 'package:gpp/screens/register/signUp.dart';
import 'package:gpp/screens/splash/splash.dart';

class Router extends StatefulWidget {
  Router();

  @override
  _RouterState createState() => _RouterState();
}

class _RouterState extends State<Router> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Global Positioned Pet',
      theme: ThemeData(
        primaryColor: Colors.black,
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins'
      ),
      routes: {
        "/": (context) => SignIn(),
        "/home": (context) => HomeContent(),
        "/signup": (context) => SignUp(),
        "/splash": (context) => SplashScreen(),
        "/pet": (context) => Pet(),
        "/create_pet": (context) => CreatePetView()
      },
      initialRoute: "/splash",
    );
  }
}