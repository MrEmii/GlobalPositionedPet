import 'package:flutter/cupertino.dart';

class CreatePetProvider extends ChangeNotifier{

  final formKeys = [GlobalKey<FormState>(), GlobalKey<FormState>()];
  final TextEditingController name = TextEditingController();
  final TextEditingController race = TextEditingController();
  final TextEditingController old = TextEditingController();
  final TextEditingController weight = TextEditingController();
  final TextEditingController neckSize = TextEditingController();
  final TextEditingController street = TextEditingController();
  final TextEditingController number = TextEditingController();
  final TextEditingController cellphone = TextEditingController();

  String oldType = "Año(s)";
  String weightType = "Kg(s)";
  String sizeType = "Mt(s)";

}