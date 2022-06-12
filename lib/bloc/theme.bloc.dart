import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movity_app/UI/theme.ui.dart'as Style;
import 'package:movity_app/constants/constants.dart';


Map<int, Color> color =
{
  50:  const  Color(0x00031B3B),//10%
  100: const Color(0xFFB74C3A),//20%
  200: const Color(0xFFA04332),//30%
  300: const Color(0xFF89392b),//40%
  400: const Color(0xFF733024),//50%
  500: const Color(0xFF5C261D),//60%
  600: const Color(0xFF451C16),//70%
  700: const Color(0xFF2E130E),//80%
  800: const Color(0xFF170907),//90%
  900: const Color(0xFF000000),//100%
};

abstract class ThemeEvent {}

class SwitchThemeEvent extends ThemeEvent {}

class ThemeState {
  final ThemeData theme;

  ThemeState(this.theme);
}
MaterialColor colorCustom = MaterialColor(0xFF151C26, color);

class MyThemes {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Style.Colors.mainColor,
      primarySwatch: colorCustom,
      bottomAppBarColor: Colors.white,
      canvasColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      backgroundColor: Colors.black,
      focusColor: Colors.white,
      //colorScheme: ColorScheme.dark(),
      iconTheme: const IconThemeData(
          color: Colors.white,
          size: 30.0
      ),
      primaryTextTheme:
      TextTheme(
          headline1: TextStyle(color: Colors.white,fontSize: 60, ),
          bodyText2: TextStyle(color: Colors.white,fontSize: 14, ),
          headline6: TextStyle(color: Colors.white,fontSize: 20, ),
          bodyText1 : TextStyle(fontSize: 22.0, color: Colors.white ,fontWeight: FontWeight.bold),
          subtitle1: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          subtitle2: TextStyle(color: white.withOpacity(0.6), fontSize: 12,)
      ));
static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: colorCustom,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    //colorScheme: ColorScheme.light(),
    canvasColor: const Color(0xFF151C26),
    bottomAppBarColor: Colors.black,
    backgroundColor: Colors.white,
    focusColor: Colors.black,
    iconTheme: IconThemeData(
        color: Colors.white,
        size: 30.0
    ),
    primaryTextTheme:
    TextTheme(headline1: TextStyle(color: Colors.black,fontSize: 60, ),
        bodyText2: TextStyle(color: Colors.white,fontSize: 14, ),
        headline6: TextStyle(color: Colors.black,fontSize: 20, ),
        bodyText1: TextStyle(fontSize: 22.0 ,fontWeight: FontWeight.bold,color: Colors.black),
        subtitle1: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
        subtitle2: TextStyle(color: black.withOpacity(0.6), fontSize: 12,)
    ),

);
}

class InitialTheme extends ThemeState {
  InitialTheme()
      : super(MyThemes.lightTheme);
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  int index = 0;
  List<ThemeData> themes = [
    MyThemes.darkTheme,MyThemes.lightTheme
    ];

  ThemeBloc() : super(InitialTheme()) {
    on((SwitchThemeEvent event, emit) {
      ++index;
      if (index >= themes.length) index = 0;
      emit(ThemeState(themes[index]));
    });
  }
}
