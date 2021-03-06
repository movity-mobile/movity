import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movity_app/bloc/theme.bloc.dart';
import 'package:movity_app/pages/Search.page.dart';
import 'package:movity_app/pages/clubs.page.dart';
import 'package:movity_app/pages/home.page.dart';
import 'package:movity_app/pages/qrGenerator.page.dart';
import 'package:movity_app/pages/qrScanner.page.dart';

import 'movies.page.dart';

class RootView extends StatelessWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc,ThemeState>(
        builder: (context,state){
          return MaterialApp(
            //themeMode: ThemeMode.system,
            theme: state.theme,
            darkTheme: state.theme,
            debugShowCheckedModeBanner: false,
            routes: {
              "/":(context)=> HomePage(),
              "/qrGenerator":(context)=>const QRCodePage(),
              "/qrScanner": (context)=> QrScannerPage(),
              "/search": (context)=> const MoviesPage(),
              "/movies":(context)=> SearchPage(),
              "/clubs" : (context) => ClubsPage()
            },
            initialRoute: "/",
          );
        }
    );
  }
}
