import 'package:flutter/material.dart';
import 'package:movity_app/UI/theme.ui.dart' as Style;

import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:movity_app/bloc/theme.bloc.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final menus=[
      {"title":"Home", "icon": Icon(Icons.home, color: Style.Colors.secondColor), "route":"/"},
      {"title":"Search", "icon": Icon(Icons.search, color: Style.Colors.secondColor), "route":"/search"},
      {"title":"Movies", "icon": Icon(Icons.movie, color: Style.Colors.secondColor), "route":"/movies"},
      {"title":"QR Code Generate", "icon": Icon(Icons.qr_code, color: Style.Colors.secondColor), "route":"/qrGenerator"},
      {"title":"QR Scan ", "icon": Icon(Icons.qr_code_scanner, color: Style.Colors.secondColor), "route":"/qrScanner"},
    ];
    return Drawer(
      backgroundColor: Style.Colors.mainColor ,
      child: Column(
        children: [

          Expanded(
            child: ListView.separated(
                separatorBuilder: (_,__){
                  return Divider(color:Style.Colors.mainColor,height: 1,);
                },
                itemCount: menus.length,
                itemBuilder: (_,index){
                  return ListTile(
                    leading: menus[index]['icon'] as Icon,
                    title: Text("${menus[index]['title']}", style: TextStyle(color: Colors.white),),
                    onTap: (){
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context, "${menus[index]['route']}");
                    },
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}
