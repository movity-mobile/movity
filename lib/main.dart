import 'package:movity_app/pages/home.page.dart';
import 'UI/kToDark.UI.dart';
import 'package:flutter/material.dart';




void main()=> runApp(MyApp());



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context)=>HomePage(),


      },
      theme: ThemeData(
         // backgroundColor: Colors.black45,
          primarySwatch: Palette.kToDark
      ),
      initialRoute: "/",


    );
  }
}



