import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movity_app/UI/kToDark.UI.dart';

abstract class ThemeEvent {}

class SwitchThemeEvent extends ThemeEvent {}

class ThemeState {
  final ThemeData theme;

  ThemeState(this.theme);
}

class InitialTheme extends ThemeState {
  InitialTheme()
      : super(ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primarySwatch: Colors.red,
            //colorScheme: ColorScheme.light(),
      bottomAppBarColor: Colors.black,
            primaryTextTheme:
                const TextTheme(headline6: TextStyle(color: Colors.black))));
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  int index = 0;
  List<ThemeData> themes = [
    ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.red,
        //colorScheme: ColorScheme.light(),
        bottomAppBarColor: Colors.black,
        //iconTheme: Colors.white,
        primaryTextTheme:
            const TextTheme(headline6: TextStyle(color: Colors.black))),
    ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade900,
        primarySwatch: Colors.red,
        bottomAppBarColor: Colors.white,
        //colorScheme: ColorScheme.dark(),
        primaryTextTheme:
            const TextTheme(headline6: TextStyle(color: Colors.white)))
  ];

  ThemeBloc() : super(InitialTheme()) {
    on((SwitchThemeEvent event, emit) {
      ++index;
      if (index >= themes.length) index = 0;
      emit(ThemeState(themes[index]));
    });
  }
}
