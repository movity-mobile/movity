import 'package:movity_app/bloc/movie.details.bloc.dart';
import 'package:movity_app/pages/Search.page.dart';
import 'package:movity_app/pages/home.page.dart';
import 'package:movity_app/pages/movies.page.dart';
import 'package:movity_app/pages/qrGenerator.page.dart';
import 'package:movity_app/pages/qrScanner.page.dart';
import 'UI/kToDark.UI.dart';
import 'package:movity_app/bloc/genre.bloc.dart';
import 'package:movity_app/bloc/movies.bloc.dart';
import 'package:movity_app/bloc/theme.bloc.dart';
import 'package:movity_app/pages/root.view.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()=> runApp(MyApp());



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>ThemeBloc(),),
          BlocProvider(create: (context)=>MovieBloc(),),
          BlocProvider(create: (context)=>GenreBloc(),),
          BlocProvider(create: (context)=>MovieDetailsBloc())

          
          
        child: const RootView(),

    );


  }
}



