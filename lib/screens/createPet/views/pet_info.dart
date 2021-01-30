import 'package:flutter/material.dart';
import 'package:gpp/screens/createPet/create_pet_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class PetInformation extends StatefulWidget {
  PetInformation({Key key}) : super(key: key);

  @override
  _PetInformationState createState() => _PetInformationState();
}

class _PetInformationState extends State<PetInformation> {


  Future getImage(provider) async {
    var img = await ImagePicker.pickImage(source: ImageSource.gallery, maxWidth: 1000, maxHeight: 1000);
    if (img != null) {
      provider.bannerFile = FileImage(img);
      provider.notify();
    }
  }

  @override
  Widget build(BuildContext context) {

    CreatePetProvider provider = Provider.of<CreatePetProvider>(context, listen: true);

    return Container(
      child: Column(
        children: [
          Container(),
          Form(
            key: provider.formKeys[0],
            child: Text("HOLÑA"),
          )
        ],
      ),
    );
  }
}