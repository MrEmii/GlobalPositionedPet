import 'package:flutter/material.dart';
import 'package:gpp/screens/home/screens/main/home.dart';
import 'package:gpp/screens/home/screens/map/map.dart';
import 'package:gpp/screens/home/screens/menu/menu.dart';
import 'package:gpp/screens/home/screens/user/account.dart';
import 'package:gpp/widgets/gppicons.dart';

class HomeContent extends StatefulWidget {

  HomeContent();

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {

  @override
  void initState() {
    super.initState();
  }

  ValueNotifier<int> indexPage = ValueNotifier(1);

  static List<Widget> appPages = [
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Vista en construcción 1", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    ),
    Home(),
    PetLocationMap(),
    AccountView()
  ];

  void _onChangeView(index){
    setState(() {
      indexPage.value = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: this.indexPage,
      builder: (context, value, child){
        return Scaffold(
          drawerScrimColor: Colors.black38,
          endDrawer: Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
            child: Drawer(child: MenuWrapper()),
          ),
          body: appPages.elementAt(value) ?? appPages.elementAt(0),
          extendBody: true,
          bottomNavigationBar: Container(
            margin: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(33), topRight: Radius.circular(33)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(33), topRight: Radius.circular(33)),
              child: BottomNavigationBar(
                selectedFontSize: 0,
                unselectedFontSize: 0,
                currentIndex: value,
                showSelectedLabels: true,
                type: BottomNavigationBarType.fixed,
                iconSize: 23,
                onTap: _onChangeView,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(GPPIcons.tv_retro),
                    title: Text('Social'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(GPPIcons.compass),
                    title: Text('Incio'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(GPPIcons.map),
                    title: Text('Mapa'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(GPPIcons.user),
                    title: Text('Cuenta'),
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}