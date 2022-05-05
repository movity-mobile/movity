import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:movity_app/pages/Search.page.dart';
import 'package:movity_app/pages/qrGenerator.page.dart';
import 'package:movity_app/pages/qrScanner.page.dart';

import '../pages/home.page.dart';
class MyDrawer extends StatefulWidget {

  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[ Icon(Icons.home, size: 30),
      Icon(Icons.search, size: 30,),
      Icon(Icons.movie, size: 30),
      Icon(Icons.qr_code, size: 30),
      Icon(Icons.qr_code_scanner, size: 30),];
    final screens = [
      HomePage(),
      QrGeneratorPage(),
      QrScannerPage(),
      SearchPage(),
    ];
    int _page = 0;
    return CurvedNavigationBar(
        //color: Theme.of(context).primaryColor,
        backgroundColor: Colors.transparent,
        height: 60,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        items: items);
  }
}
