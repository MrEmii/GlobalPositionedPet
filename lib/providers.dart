import 'package:flutter/material.dart';
import 'package:gpp/router.dart';
import 'package:gpp/screens/createPet/create_pet_provider.dart';
import 'package:gpp/screens/home/screens/providers/userprovider.dart';
import 'package:provider/provider.dart';

class ProviderWrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        ChangeNotifierProvider<CreatePetProvider>(create: (_) => CreatePetProvider()),
      ],
      child: new Router(),
    );
  }
}