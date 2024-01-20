import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/constants/colors.dart';
import 'package:flutter_app/src/features/screens/drawer/drawer.dart';
import 'package:flutter_app/src/features/screens/home_view/home_page.dart';
import 'package:flutter_app/src/features/screens/price_alert/price_alert.dart';

class BtmNav extends StatefulWidget {
  final int index;
  const BtmNav({super.key, this.index = 0}) ;

  @override
  State<BtmNav> createState() => _BtmNavState();
}

class _BtmNavState extends State<BtmNav> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _btmnavindex = 0;

  void onAnyIndex(int index){
    setState(() {
      _btmnavindex = index ;
    });
  }

  Widget pageCaller(int index) {
    switch (index) {
      case 0:
        {
          return const HomePage();
        }
      case 1:
        {
          return const PriceAlerts();
        }
      case 2:
        {
          return const DrawerPage();
        }
    }
    return Container(
      color: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(child: pageCaller(_btmnavindex)),
      bottomNavigationBar: BottomNavigationBar(
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          iconSize: 30,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black.withOpacity(0.7),
          selectedLabelStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          unselectedLabelStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          type: BottomNavigationBarType.fixed,
          backgroundColor: bckgnd,
          elevation: 8,
          currentIndex: _btmnavindex,
          onTap: onAnyIndex ,
        items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart), label: 'Alerts'),
        BottomNavigationBarItem(
            icon: Icon(Icons.menu,), label: 'Menu'),
      ]),
    );
  }
}
