import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[ Icon(Icons.home, size: 30), Icon(Icons.search, size: 30), Icon(Icons.movie, size: 30), Icon(Icons.qr_code, size: 30), Icon(Icons.qr_code_scanner, size: 30),];
    return CurvedNavigationBar(
        backgroundColor: Colors.black45,
        items: items);
  }
}
