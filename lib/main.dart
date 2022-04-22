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

          primarySwatch: Palette.kToDark,
          primaryTextTheme: const TextTheme(
          headline6: TextStyle(
          color: Colors.white
          ))




      ),
      initialRoute: "/",


    );
  }
}



