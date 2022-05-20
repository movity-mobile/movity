import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:movity_app/bloc/theme.bloc.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final menus=[
      {"title":"Home", "icon": Icon(Icons.home, color: Theme.of(context).primaryColor,), "route":"/"},
      {"title":"Search", "icon": Icon(Icons.search, color: Theme.of(context).primaryColor), "route":"/search"},
      {"title":"Movies", "icon": Icon(Icons.movie, color: Theme.of(context).primaryColor), "route":"/movies"},
      {"title":"QR Code Generate", "icon": Icon(Icons.qr_code, color: Theme.of(context).primaryColor), "route":"/qrGenerator"},
      {"title":"QR Scan ", "icon": Icon(Icons.qr_code_scanner, color: Theme.of(context).primaryColor), "route":"/qrScanner"},
    ];
    return Drawer(
      child: Column(
        children: [

          Expanded(
            child: ListView.separated(
                separatorBuilder: (_,__){
                  return Divider(color: Theme.of(context).primaryColor,height: 1,);
                },
                itemCount: menus.length,
                itemBuilder: (_,index){
                  return ListTile(
                    leading: menus[index]['icon'] as Icon,
                    title: Text("${menus[index]['title']}"),
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
