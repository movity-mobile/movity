import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movity_app/UI/kToDark.UI.dart';

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
MaterialColor colorCustom = MaterialColor(0xFFB74C3A, color);

class MyThemes {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade900,
      primarySwatch: colorCustom,
      bottomAppBarColor: Colors.white,
      //colorScheme: ColorScheme.dark(),
      iconTheme: new IconThemeData(
          color: Colors.black,
          size: 30.0
      ),
      primaryTextTheme:
      const TextTheme(headline6: TextStyle(color: Colors.white,fontSize: 60, )));
static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: colorCustom,
    //colorScheme: ColorScheme.light(),
    bottomAppBarColor: Colors.black,
    iconTheme: IconThemeData(
        color: Colors.white,
        size: 30.0
    ),
    primaryTextTheme:
    const TextTheme(headline6: TextStyle(color: Colors.black,fontSize: 60, )));
}

class InitialTheme extends ThemeState {
  InitialTheme()
      : super(MyThemes.darkTheme);
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
