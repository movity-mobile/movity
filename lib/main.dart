import 'package:movity_app/pages/Search.page.dart';
import 'package:movity_app/pages/home.page.dart';
import 'package:movity_app/pages/movies.page.dart';
import 'package:movity_app/pages/qrGenerator.page.dart';
import 'package:movity_app/pages/qrScanner.page.dart';
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
        "/search":(context)=>SearchPage(),
        "/movies":(context)=>MoviesPage(),
        "/qrGenerator":(context)=>QrGeneratorPage(),
        "/qrScanner":(context)=>QrScannerPage(),


      },
      theme: ThemeData(

          primarySwatch: Palette.kToDark,
          primaryColor: Colors.black87,
          primaryTextTheme: const TextTheme(
          headline6: TextStyle(
          color: Colors.black
          ))




      ),
      initialRoute: "/",


    );
  }
}



